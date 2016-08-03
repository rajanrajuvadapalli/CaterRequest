$(document).ready( function() {

	var bucket = {
		"settings" : {
			"add_to_cart_timeout" : 5000,
			"currency_symbol" : '$'
		},
		"data" : {
			"ready" : false,
			"url" : window.menu_source_url,
			"content" : {}
		},
		"templates" : {
			"loaded" : 0,
			"url" : "/cater4party/resources/assets/cl-templates/",
			"list" : [
				{
					"name"    : "category_wrapper",
					"file"    : "category_wrapper.html",
					"content" : ""
				},
				{
					"name"    : "item_wrapper",
					"file"    : "item_wrapper.html",
					"content" : ""
				},
				{
					"name"    : "addition_wrapper",
					"file"    : "addition_wrapper.html",
					"content" : ""
				},
				{
					"name"    : "ingredient_single",
					"file"    : "ingredient_single.html",
					"content" : ""
				},
				{
					"name"    : "ingredient_multiple",
					"file"    : "ingredient_multiple.html",
					"content" : ""
				},
				{
					"name"    : "shopping_cart_item",
					"file"    : "shopping_cart_item.html",
					"content" : ""
				},
				{
					"name"    : "item_textarea",
					"file"    : "item_textarea.html",
					"content" : ""
				}
			]
		},
		"thread_ids" : {
			add_to_cart : null
		},
		"active_rb" : null,
		"shopping_cart_id" : 0,
		"shopping_cart_items" : {},
		"shopping_cart_edit_item_id": null
	};
	delete window.menu_source_url;

	// get product data
	function get_product_data(product_id) {

		for (var i in bucket.data.content.products) {

			if (bucket.data.content.products[i].id == product_id) {
				return bucket.data.content.products[i];
			}
		}

		console.error("Missing product: " + product_id);
		return "Missing product";
	}

	// get template content
	function get_template_content(name) {

		for (var i in bucket.templates.list) {

			if (bucket.templates.list[i].name == name) {
				return bucket.templates.list[i].content;
			}
		}

		console.error("Missing template: " + name);
		return "Missing template";
	}

	// load data
	function load_data() {
		console.log("menu URL: " + bucket.data.url);
		$.getJSON( bucket.data.url, function(data) {
			bucket.data.ready = true;
			bucket.data.content = data;
		});
	}

	// load templates
	function load_templates() {

		var url = bucket.templates.url;

		for (var id in bucket.templates.list) {
			load_template_file(id, url + bucket.templates.list[id].file);
		}
	}

	// load template
	function load_template_file(id, url) {

		$.get( url, function(data) {
			store_template_content(id, data);
			bucket.templates.loaded += 1;
		}, "text");
	}

	// store template content
	function store_template_content(id, content) {

		bucket.templates.list[id].content = content;
	}

	// start the apllication if...
	function app_init() {

		var tid;

		tid = setInterval( function() {
			// all files loaded?
			if (bucket.templates.loaded == bucket.templates.list.length && bucket.data.ready) {
				clearInterval(tid);
				app_run();
			}
		}, 50);
	}

	// template :: set category id and name
	function template_set_category(template, name, id) {

		category_name = name;
		// category_id = name.replace(/\s/g, "_");
		category_id = name.replace(/[^a-zA-Z0-9]+/g, "_") + "_" + id;

		template = template.replace(/\{\{category_id\}\}/g, category_id);
		template = template.replace(/\{\{category_name\}\}/g, category_name);

		return template;
	}

	// template :: add the category items
	function template_add_items(template, items) {

		return template.replace('{{items}}', items);
	}

	// template :: add the category item additions
	function template_add_item_additions(template, additions) {

		return template.replace('{{additions}}', additions);
	}

	// template :: set item id, name and other basic info
	function template_set_item_basics(template, item) {

		var item_name = item.name;
		// var item_id = item.name.replace(/\s/g, "_");
		var item_id = item.name.replace(/[^a-zA-Z0-9]+/g, "_") + "_" + item.id;

		var item_special_instructions_maxlength = (item.instructions.maxlength !== false) ? item.instructions.maxlength : "";

		var price = product_compile_price(item);

		template = template.replace(/\{\{item_id\}\}/g, item_id);
		template = template.replace(/\{\{item_name\}\}/g, item_name);
		template = template.replace(/\{\{item_quantity\}\}/g, (item.min === false) ? 1 : item.min);
		template = template.replace(/\{\{item_special_instructions\}\}/g, item.instructions.content);
		template = template.replace(/\{\{item_special_instructions_maxlength\}\}/g, item_special_instructions_maxlength);
		template = template.replace(/\{\{item_description\}\}/g, item.description);
		template = template.replace(/\{\{item_price\}\}/g, price);
		template = template.replace(/\{\{category_id\}\}/g, item.category);
		template = template.replace(/\{\{product_id\}\}/g, item.id);

		return template;
	}

	// get category products
	function get_category_products(category_id) {

		var products = [];

		for (var i in bucket.data.content.products) {

			if (bucket.data.content.products[i].category == category_id) {
				products.push(bucket.data.content.products[i]);
			}
		}

		return products;
	}

	// get item addition
	function get_item_addition(addition_id) {

		for (var i in bucket.data.content.additions) {

			if (bucket.data.content.additions[i].id == addition_id) {
				return bucket.data.content.additions[i];
			}
		}

		console.error("Missing addition: " + addition_id);
		return "Missing addition";
	}

	// get ingredient data
	function get_ingredient_data(ingredient_id) {

		for (var i in bucket.data.content.ingredients) {

			if (bucket.data.content.ingredients[i].id == ingredient_id) {
				return bucket.data.content.ingredients[i];
			}
		}

		console.error("Missing ingredient: " + ingredient_id);
		return "Missing ingredient";
	}

	// get addition data
	function get_addition_data(addition_id) {

		for (var i in bucket.data.content.additions) {

			if (bucket.data.content.additions[i].id == addition_id) {
				return bucket.data.content.additions[i];
			}
		}

		console.error("Missing addition: " + addition_id);
		return "Missing addition";
	}

	// compile ingredient
	function compile_ingredient(template, name, input_name, input_value) {

		template = template.replace(/\{\{name\}\}/g, name);
		template = template.replace(/\{\{input_name\}\}/g, input_name);
		template = template.replace(/\{\{input_value\}\}/g, input_value);

		return template;
	}

	// compile ingredient "multiple"
	function compile_ingredient_multiple(template, data, addition_id) {

		return compile_ingredient(template, data.name, "ingredient_" + addition_id, data.id);
	}

	// compile ingredient "single"
	function compile_ingredient_single(template, data, addition_id) {

		return compile_ingredient(template, data.name, "ingredient_" + addition_id, data.id);
	}

	// compile addition ingredients
	function compile_addition_ingredients(ingredient, type, addition_id) {

		var template, result, ingredient_data;

		ingredient_data = get_ingredient_data(ingredient);

		switch (type) {

			case "single":
				template = get_template_content("ingredient_single");
				result = compile_ingredient_single(template, ingredient_data, addition_id);
				break;

			case "multiple":
				template = get_template_content("ingredient_multiple");
				result = compile_ingredient_multiple(template, ingredient_data, addition_id);
				break;

			default:
				console.error("unknown addition type");
		}

		return result;
	}

	// compile addition "text"
	function compile_addition_text(addition_source, item_textarea) {

		var textarea = item_textarea;

		textarea = textarea.replace(/\{\{max\}\}/g, addition_source.max);

		return textarea;
	}

	// compile single addition
	function compile_item_addition(addition_id, addition_wrapper, item_textarea) {

		var max, ingredients = "";
		var addition_source = get_item_addition(addition_id);
		/* example
		{
			"id"          : 1,
			"name"        : "Burger Additions",
			"min"         : false,
			"max"         : 9,
			"type"        : "multiple",
			"ingredients" : [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
		}
		*/

		// id
		addition_wrapper = addition_wrapper.replace("{{addition_id}}", addition_source.id);

		// name
		addition_wrapper = addition_wrapper.replace("{{name}}", addition_source.name);

		// max
		/*
		if (addition_source.type == "single" || addition_source.max === false) {
			max = "";
		}
		else {
			max = "(" + addition_source.max + " max)";
		}
		addition_wrapper = addition_wrapper.replace("{{max}}", max);
		*/

		// ingredients
		if (addition_source.type == "text") {
			ingredients = compile_addition_text(addition_source, item_textarea);
		}
		else {
			for (var i in addition_source.ingredients) {

				ingredients += compile_addition_ingredients(addition_source.ingredients[i], addition_source.type, addition_id);
			}
		}

		return addition_wrapper.replace("{{ingredients}}", ingredients);
	}

	// add item additions
	function add_item_additions(item, additions_source, addition_wrapper, item_textarea) {

		var additions = "";

		if (typeof(additions_source) === "object" && additions_source.length > 0) {

			for (var i in additions_source) {

				additions += compile_item_addition(additions_source[i], addition_wrapper, item_textarea);
			}
		}

		return template_add_item_additions(item, additions);
	}

	// compile category products
	function compile_category_items(category_items, tmpl_item_wrapper, addition_wrapper, item_textarea) {

		var result = '',
			item;

		for (var i in category_items) {

			// add the basic item information
			item = template_set_item_basics(tmpl_item_wrapper, category_items[i]);

			// add the item additions
			item = add_item_additions(item, category_items[i].additions, addition_wrapper, item_textarea);

			result += item; // temp : test only
		}

		return result;
	}

	// compile all the data
	function compile_data() {

		var category_content,
			category_id,
			products,
			menu_container = $("#full-menu");

		// templates
		var tmpl_category_wrapper = get_template_content("category_wrapper");
		var tmpl_item_wrapper = get_template_content("item_wrapper");
		var addition_wrapper = get_template_content("addition_wrapper");
		var item_textarea = get_template_content("item_textarea");

		// compile
		for (var i in bucket.data.content.categories) {

			category_content = template_set_category(tmpl_category_wrapper, bucket.data.content.categories[i].name, bucket.data.content.categories[i].id);
			category_items = get_category_products(bucket.data.content.categories[i].id);

			products = compile_category_items(category_items, tmpl_item_wrapper, addition_wrapper, item_textarea);

			category_content = template_add_items(category_content, products);

			// adds the category content to the page's DOM
			menu_container.append(category_content);
		}
	}

	// run the application
	function app_run() {
		// console.info("*** APPLICATION STARTED");

		compile_data();
	}

	// collect the values from all selected ingredients
	function get_selected_ingredients(ingredients_obj) {

		var ids = [];

		ingredients_obj.find("input.sel_ingredient").each( function() {

			if ($(this).is(":checked")) {
				ids.push(parseInt($(this).val()));
			}
		});

		return ids;
	}

	// collect all the information from selected additions
	function collect_additions_selected(obj) {

		var additions = [];
		var addition_id, ingredients_obj, selected_ingredients, data;

		obj.find("[data-aid].sel_addition").each( function() {

			addition_id = $(this).data("aid");
			ingredients_obj = $(this).find(".sel_ingredients");

			data = {
				id : addition_id
			};

			// (type) "text"
			var text_type = ingredients_obj.find(".sel_freetext");
			if (text_type.length > 0) {
				data["text"] = text_type.val().trim();
			}
			// (type) "single" or "multiple"
			else {
				selected_ingredients = get_selected_ingredients(ingredients_obj);
				data["ingredients"] = selected_ingredients;
			}

			additions.push(data);
		});

		return additions;
	}

	// collect the item data
	function collect_item_data(obj) {

		var quantity = obj.find(".sel_quantity").val().trim();
		if (! /^(?!0)\d+$/.test(quantity)) {
			quantity = 1;
		}
		else {
			quantity = parseInt(quantity);
		}

		return {
			category_id : obj.data("cid"),
			product_id : obj.data("pid"),
			quantity : quantity,
			instructions : obj.find(".sel_special_instructions").val(),
			additions : collect_additions_selected(obj)
		};
	}

	// validate category id
	function validate_category_id(category_id) {

		for (var i in bucket.data.content.categories) {

			if (bucket.data.content.categories[i].id == category_id) {
				return true;
			}
		}

		throw new Error("Invalid category id");
	}

	// validate product id
	function validate_product_id(product_id) {

		for (var i in bucket.data.content.products) {

			if (bucket.data.content.products[i].id == product_id) {
				return true;
			}
		}

		throw new Error("Invalid product id");
	}

	// validate product category
	function validate_product_category(product_id, category_id) {

		for (var i in bucket.data.content.products) {

			if (bucket.data.content.products[i].id == product_id && bucket.data.content.products[i].category == category_id) {
				return true;
			}
		}

		throw new Error("Invalid product category");
	}

	// validate addition id
	function validate_addition_id(addition_id) {

		for (var i in bucket.data.content.additions) {

			if (bucket.data.content.additions[i].id == addition_id) {
				return true;
			}
		}

		throw new Error("Invalid addition id");
	}

	// validate quantity
	function validate_quantity(product_id, quantity) {

		var product = get_product_data(product_id);

		if (product.min !== false && product.min > quantity) {
			return "Invalid quantity! Minimum of " + product.min + " is required.";
		}
		else if (product.max !== false && product.max < quantity) {
			return "Invalid quantity! Maximum of " + product.max + " is required.";
		}

		return true;
	}

	// set add to cart error
	function set_add_to_cart_error(message, wrapper) {

		wrapper.html(message);
		wrapper.show();

		clearTimeout(bucket.thread_ids.add_to_cart);
		bucket.thread_ids.add_to_cart = setTimeout( function() {

			wrapper.html("");
			wrapper.hide();
		}, bucket.settings.add_to_cart_timeout);
	}

	// validate additions
	function validate_additions(additions) {

		for (var i in additions) {
			validate_addition_id(additions[i].id);
		}
	}

	// validate ingredient id
	function validate_ingredient_id(ingredient_id) {

		for (var i in bucket.data.content.ingredients) {

			if (bucket.data.content.ingredients[i].id == ingredient_id) {
				return true;
			}
		}

		throw new Error("Invalid ingredient id");
	}

	// validate ingredients
	function validate_ingredients(additions) {

		for (var i in additions) {

			// "single", "multiple"
			if (typeof(additions[i].ingredients) !== "undefined") {
				for (var a in additions[i].ingredients) {
					validate_ingredient_id(additions[i].ingredients[a]);
				}
			}
			else if (typeof(additions[i].text) !== "undefined") {
				// no action needed
			}
			else {
				throw new Error("Unknown addition type");
			}
		}
	}

	// validate ingredients addition
	function validate_ingredients_addition(additions) {

		var found, product, addition;

		for (var i in additions) {

			if (typeof(additions[i].ingredients) !== "undefined") {
				for (var a in additions[i].ingredients) {

					addition = get_addition_data(additions[i].id);

					found = false;

					for (var b in addition.ingredients) {
						if (additions[i].ingredients[a] == addition.ingredients[b]) {
							found = true;
							break;
						}
					}

					if ( ! found) {
						throw new Error("Invalid product ingredient");
					}
				}
			}
			// "text" type
			else if (typeof(additions[i].text) !== "undefined") {
				// no action needed
			}
			else {
				throw new Error("Unknown type");
			}
		}
	}

	// validate min and max selected
	function validate_min_and_max_selected(item_selected) {

		var instructions = item_selected.instructions;
		var additions = item_selected.additions;
		var id, total_selected;

		// instructions
		if (instructions.length > 0) {
			var product_data = get_product_data(item_selected.product_id);
			if (product_data.instructions.maxlength !== false && product_data.instructions.maxlength < instructions.length) {
				return "No more than " + product_data.instructions.maxlength + " characters allowed for Special Instructions";
			}
		}

		// additions
		for (var i in additions) {

			addition = get_addition_data(additions[i].id);

			// "single", "multiple"
			if (typeof(additions[i].ingredients) !== "undefined") {
				total_selected = additions[i].ingredients.length;
			}
			// "text" type
			else if (typeof(additions[i].text) !== "undeinfed") {
				total_selected = additions[i].text.length;
			}
			// Unknown
			else {
				throw new Error("Unknown addition type");
			}

			// min
			if (addition.min !== false && total_selected < addition.min) {
				return "\"" + addition.name + "\" requires at least " + addition.min + " selected";
			}
			// max
			else if (addition.max !== false && total_selected > addition.max) {
				return "\"" + addition.name + "\" requires no more than " + addition.max + " selected";
			}
		}

		return true;
	}

	// validate item selected
	function validate_item(item_selected, status_wrapper) {

		var quantity, ingredients_quantity;

		try {
			// category id
			validate_category_id(item_selected.category_id);

			// product id
			validate_product_id(item_selected.product_id);

			// product category
			validate_product_category(item_selected.product_id, item_selected.category_id);

			// quantity
			quantity = validate_quantity(item_selected.product_id, item_selected.quantity);
			if (quantity !== true) {
				set_add_to_cart_error(quantity, status_wrapper);
				return false;
			}

			// additions
			validate_additions(item_selected.additions);

			// ingredients
			validate_ingredients(item_selected.additions);

			// ingredients addition
			validate_ingredients_addition(item_selected.additions);

			// min and max selected
			ingredients_quantity = validate_min_and_max_selected(item_selected);
			if (ingredients_quantity !== true) {
				set_add_to_cart_error(ingredients_quantity, status_wrapper);
				return false;
			}
		}
		catch (e) {
			console.error(e.message);
			return false;
		}

		return true;
	}

	// enable/disable not selected ingredients reaching max/min
	// ! onty of type "multiple" (checkbox)
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-aid].sel_addition");
			var addition_data = get_addition_data( obj.data("aid") );
			var total_selected = obj.find(".sel_ingredient:checked").length;

			// max
			if (addition_data.max !== false && addition_data.max <= total_selected) {
				obj.find(".sel_ingredient").prop("disabled", true);
				obj.find(".sel_ingredient:checked").prop("disabled", false);
			}
			else {
				obj.find(".sel_ingredient").prop("disabled", false);
			}
		}
	}, ".sel_ingredients input.sel_ingredient[type=checkbox]");

	// select/deselect ingredient if no min value defined
	// ! onty of type "single" (radio)
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-aid].sel_addition");
			var id = $(this).val();
			var cid = $(this).closest("[data-cid]").data("cid");
			var pid = $(this).closest("[data-pid]").data("pid");

			var active_rb = cid + ":" + pid + ":" + id;

			if (bucket.active_rb == active_rb) {

				var addition_data = get_addition_data(obj.data("aid"));

				if (addition_data.type = "single" && addition_data.min == false) {
					$(this).prop("checked", false);
					bucket.active_rb = null;
				}
			}
			else {
				bucket.active_rb = active_rb;
			}
		}
	}, ".sel_ingredients input.sel_ingredient[type=radio]");

	// returns the a shopping cart item data
	function get_shopping_cart_item(item_id) {

		return bucket.shopping_cart_items[item_id];
	}

	// store the shopping cart items with their ids
	function store_shopping_cart_item(item) {

		var id = "id_" + (++bucket.shopping_cart_id);

		bucket.shopping_cart_items[id.toString()] = item;

		return id;
	}

	// remove the shopping cart items with their ids
	function remove_shopping_cart_item(item_id) {

		var items = {};

		for (var i in bucket.shopping_cart_items) {
			if (i != item_id) {
				items[i] = bucket.shopping_cart_items[i];
			}
		}

		bucket.shopping_cart_items = items;
	}

	// compile the additions of a shopping cart item
	function compile_cart_item_additions(additions) {

		var result = [], addition_data, product, ingredient_data, ingredient_name;

		for (var i in additions) {

			addition_data = get_addition_data(additions[i].id);

			// "single", "multiple"
			if (typeof(additions[i].ingredients) !== "undefined") {
				var ingredients = [];

				for (var a in additions[i].ingredients) {

					ingredient_data = get_ingredient_data(additions[i].ingredients[a]);

					if (ingredient_data.price > 0) {
						ingredient_name = ingredient_data.name + " " + "($" + ingredient_data.price.toFixed(2) + ")";
					}
					else {
						ingredient_name = ingredient_data.name;
					}

					ingredients.push(ingredient_name);
				}

				if (ingredients.length > 0) {
					ingredients = ": " + ingredients.join(", ");
				}
				else {
					ingredients = "";
				}

				product = addition_data.name + ingredients;
			}
			// "text"
			else if (typeof(additions[i].text) !== "undefined") {

				if (additions[i].text.length > 0) {
					// addition_data.name
					// additions[i].text
					product = addition_data.name + ": " + additions[i].text;
				}
				else {
					continue;
				}
			}
			// Unknown
			else {
				throw new Error("Unknown addition type");
			}

			result.push(product);
		}

		return result.join("; ");
	}
	
	function compile_cart_item_additions_prices(additions) {
		var result = [], addition_data, product, ingredient_data, ingredient_name;
		for (var i in additions) {
			addition_data = get_addition_data(additions[i].id);
			// "single", "multiple"
			if (typeof(additions[i].ingredients) !== "undefined") {
				var ingredients = [];
				for (var a in additions[i].ingredients) {
					ingredient_data = get_ingredient_data(additions[i].ingredients[a]);
					if (ingredient_data.price > 0) {
						result.push((ingredient_data.price.toFixed(2)));
					}
				}
			}
			// Unknown
			else {
				throw new Error("Unknown addition type");
			}
		}
		return result;
	}

	// remove item from the shopping cart
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-id].sel_item");
			var id = obj.data("id");

			obj.remove();

			remove_shopping_cart_item(id);

			setup_shopping_cart_product_counter_number();

			setup_shopping_cart_summary();

			if ($("#shopping_cart [data-id].sel_item").length == 0) {
				// hide the summary
				$("#shopping_cart_summary").hide();
			}
		}
	}, "#shopping_cart .sel_item .sel_remove");

	function setup_shopping_cart_product_counter_number() {

		$("#shopping_cart [data-id].sel_item").each( function(index) {
			$(this).find(".numbering").html(index+1);
		});
	}

	// compile cart item
	function compile_cart_item(id, item, object_id) {

		// var total_price = calc_shopping_cart_item_total_price(item);
		var additions = compile_cart_item_additions(item.additions);
		var product_data = get_product_data(item.product_id);
		var instructions = (item.instructions == "") ? "" : "Special Instructions: " + item.instructions;

		var cart_item = get_template_content("shopping_cart_item");

		cart_item = cart_item.replace(/\{\{id\}\}/g, id);
		cart_item = cart_item.replace(/\{\{object_id\}\}/g, object_id);
		cart_item = cart_item.replace(/\{\{name\}\}/g, product_data.name);
		cart_item = cart_item.replace(/\{\{quantity\}\}/g, item.quantity);
		cart_item = cart_item.replace(/\{\{items\}\}/g, additions);
		cart_item = cart_item.replace(/\{\{instructions\}\}/g, instructions);
		cart_item = cart_item.replace(/\{\{base_price\}\}/g, product_data.price);
		//cart_item = cart_item.replace(/\{\{price\}\}/g, item.price);
		
		//will return array of prices []
		var result = compile_cart_item_additions_prices(item.additions);
		var expl = item.quantity + " x [$" + product_data.price;
		var cart_item_total_price = parseFloat(product_data.price);
		for(var i in result) {
			expl = expl + " + $" + parseFloat(result[i]).toFixed(2);
			cart_item_total_price += parseFloat(result[i]);
		}
		expl = expl + "]";
		
		cart_item_total_price = parseInt(item.quantity) * cart_item_total_price;
		cart_item = cart_item.replace(/\{\{price\}\}/g, cart_item_total_price.toFixed(2));

		expl = expl + " = $" + cart_item_total_price.toFixed(2);
		cart_item = cart_item.replace(/\{\{expl\}\}/g, expl);
		
		return cart_item;
	}

	// add a new item to the shopping cart list
	function add_to_shopping_cart(cart_item) {

		$("#shopping_cart").append(cart_item);
	}

	// get product price
	function product_add_price(source) {

		var addition_data, ingredient_data, price, additions_total_price = 0, pricerange_found;

		for (var i in source.additions) {

			pricerange_found = false;

			addition_data = get_addition_data(source.additions[i].id);

			if (typeof(addition_data.pricerange) === "boolean" && addition_data.pricerange === true) {
				pricerange_found = true;
			}

			for (var a in source.additions[i].ingredients) {

				ingredient_data = get_ingredient_data(source.additions[i].ingredients[a]);

				additions_total_price += ingredient_data.price;
			}
		}

		if ( ! pricerange_found) {
			product_data = get_product_data(source.product_id);
			price = product_data.price + additions_total_price;
		}
		else {
			price = additions_total_price;
		}

		return price.toFixed(2);
	}

	// compile product price
	function product_compile_price(source) {

		var product_data, addition_data;

		// default product price
		price = bucket.settings.currency_symbol + source.price.toFixed(2);

		// is price range selected?
		for (var a in source.additions) {

			addition_data = get_addition_data(source.additions[a]);

			if (typeof(addition_data.pricerange) === "boolean" && addition_data.pricerange === true) {

				var new_max_price = 0;
				var new_min_price = Number.MAX_SAFE_INTEGER;

				for (var b in addition_data.ingredients) {
					ingredient_data = get_ingredient_data(addition_data.ingredients[b]);

					if (ingredient_data.price > new_max_price) {
						new_max_price = ingredient_data.price;
					}

					if (ingredient_data.price < new_min_price) {
						new_min_price = ingredient_data.price;
					}
				}

				// the new price should not be 0 (the default value)
				if (new_max_price > 0) {
					price = bucket.settings.currency_symbol + new_max_price.toFixed(2);
				}

				if (new_max_price != new_min_price) {
					price = bucket.settings.currency_symbol + new_min_price.toFixed(2) + ' - ' + price;
				}

				break;
			}
		}

		return price;
	}

	// calculate the shopping cart summary
	function calculate_shopping_cart_summary() {

		var summary = {
			"subtotal" : 0,
			"tax" : 0,
			"total" : 0
		};

		var product_data, quantity, price, additions_total, additions_total_to_add, ingredient_data;

		for (var i in bucket.shopping_cart_items) {

			// product_data = get_product_data(bucket.shopping_cart_items[i].product_id);

			quantity = parseInt(bucket.shopping_cart_items[i].quantity);

			price = parseFloat(bucket.shopping_cart_items[i].price);

			//NOTE (hari): price already includes the additions, so we don't need to 
			//calculate additions again. Therefore commenting the following code.
			// calculate the ingredients additional price
			/*additions_total_to_add = 0;
			for (var a in bucket.shopping_cart_items[i].additions) {

				addition_data = get_addition_data(bucket.shopping_cart_items[i].additions[a].id);

				if (typeof(addition_data.pricerange) === "boolean" && addition_data.pricerange === true) {
					continue;
				}

				for (var b in bucket.shopping_cart_items[i].additions[a].ingredients) {
					ingredient_data = get_ingredient_data(bucket.shopping_cart_items[i].additions[a].ingredients[b]);
					console.log("ingredient_data.price=" + ingredient_data.price);
					additions_total_to_add += ingredient_data.price;
					console.log("additions_total_to_add=" + additions_total_to_add);
				}
			}*/

			//summary.subtotal += quantity * (price + additions_total_to_add);
			summary.subtotal += quantity * (price);
		}

		if (typeof(bucket.data.content.settings) === "object" && typeof(bucket.data.content.settings.tax) === "number" && bucket.data.content.settings.tax > 0) {
			summary.tax = (summary.subtotal / 100) * bucket.data.content.settings.tax;
		}
		else {
			summary.tax = 0;
		}
		summary.total = summary.subtotal + summary.tax;

		// make it look like a real price
		summary.tax = summary.tax.toFixed(2);
		summary.subtotal = summary.subtotal.toFixed(2);
		summary.total = summary.total.toFixed(2);

		return summary;
	}

	// calculate shopping cart item total price
	function calc_shopping_cart_item_total_price(item) {

		var total_price;
		var additions_total_price = 0;

		var ingredient_data;

		for (var a in item.additions) {
			for (var i in item.additions[a].ingredients) {

				ingredient_data = get_ingredient_data(item.additions[a].ingredients[i]);

				additions_total_price += ingredient_data.price;
			}
		}

		total_price = (item.price + additions_total_price) * item.quantity;

		return total_price.toFixed(2);
	}

	// update the shopping cart summary
	function update_shopping_cart_summary(summary) {

		$("#shopping_cart_summary_subtotal").html(summary.subtotal);
		$("#shopping_cart_summary_tax").html(summary.tax);
		$("#shopping_cart_summary_total").html(summary.total);
	}

	// setup shopping cart summary
	function setup_shopping_cart_summary() {

		// calculate the shopping cart summary
		var summary = calculate_shopping_cart_summary();

		// update the shopping cart summary
		update_shopping_cart_summary(summary);

		// show the summary
		$("#shopping_cart_summary").show();
	}

	// populate the popup item data
	function setup_popup_item_data(item_id) {

		var item_data = get_shopping_cart_item(item_id);
		var obj = $("[data-cid=" +item_data.category_id+ "][data-pid=" +item_data.product_id+ "]");

		obj.find("input.sel_quantity").val(item_data.quantity);
		obj.find("textarea.sel_special_instructions").val(item_data.instructions);

		// ingredients
		var addition_obj;
		for (var i in item_data.additions) {

			addition_obj = obj.find(".sel_addition[data-aid=" + item_data.additions[i].id + "]");

			for (var a in item_data.additions[i].ingredients) {

				addition_obj.find("input.sel_ingredient[value=" +item_data.additions[i].ingredients[a]+ "]").attr("checked", true);
			}
		}
	}

	// add to cart
	$(document).on({
		click: function() {

			var object_id = $(this).closest("[id].sel_modal").attr("id");

			var obj = $(this).closest(".sel_add_to_cart_wrapper");

			var item_selected = collect_item_data(obj);

			// validations
			if (false == validate_item(item_selected, obj.find(".sel_add_to_cart_message"))) {
				return;
			}

			// add price
			item_selected.price = product_add_price(item_selected);

			// store
			// is edit?
			if (bucket.shopping_cart_edit_item_id !== null) {
				remove_shopping_cart_item(bucket.shopping_cart_edit_item_id);
			}
			var item_id = store_shopping_cart_item(item_selected);

			// compile cart item
			var cart_item = compile_cart_item(item_id, item_selected, object_id);

			// replace the shopping cart item
			if (bucket.shopping_cart_edit_item_id !== null) {
				$("#shopping_cart [data-id="+bucket.shopping_cart_edit_item_id+"].sel_item").replaceWith(cart_item);
				bucket.shopping_cart_edit_item_id = null;
			}
			// add the item to the shopping cart
			else {
				add_to_shopping_cart(cart_item);
			}

			// setup shopping cart product counter numbers
			setup_shopping_cart_product_counter_number();

			// setup shopping cart summary
			setup_shopping_cart_summary();

			// close the popup
			$(this).closest("[id].sel_modal").find("[id].sel_close").click();
		}
	}, ".sel_add_to_cart_button");

	// edit shopping cart item
	$(document).on({
		click: function() {

			var shopping_cart_item = $(this).closest("[data-id][data-object]");

			var item_id = shopping_cart_item.data("id");
			var object_id = shopping_cart_item.data("object");

			setup_popup_item_data(item_id);

			$("#"+object_id).modal("show");

			bucket.shopping_cart_edit_item_id = item_id;
		}
	}, "#shopping_cart .sel_item .sel_edit");

	// close popup
	$(document).on({
		click: function() {

			if (bucket.shopping_cart_edit_item_id !== null) {
				bucket.shopping_cart_edit_item_id = null;
			}
		}
	}, ".sel_modal .sel_close");

	// TEMP - For testing only
	$("#upload_custom_menu_source").on({
		change: function() {

			var content = $("#upload_custom_menu_source")[0].files[0];

			/*
			// using FileReader API
			if (content) {
				// create reader
				var reader = new FileReader();
				reader.readAsText(content);
				reader.onload = function(e) {
					// browser completed reading file - display it
					alert(e.target.result);
				};
				return;
			}
			*/

			// clear the input field for future uplaods
			$(this).val("");

			if (typeof(content) === "undefined") {
				console.error("No file found");
				return;
			}

			if (typeof(FormData) !== "function") {
				alert("Your browser does not support the functionality required to continue");
				return;
			}
			var form_data = new FormData();
			form_data.append("custom-menu-source", content);

			var ajax_call = $.ajax({
				url: "custom-menu-source.php",
				method: "POST",
				dataType: "json",
				data: form_data,
				processData: false,
				contentType: false,
				cache: false
			});
			ajax_call.fail( function(jqXHR, textStatus, errorThrown) { alert(errorThrown); });
			ajax_call.done( function(res) {
				// console.log(res);

				if (res !== 1) {

					// console.dir(res);

					// add the new data
					// bucket.data.ready = true;
					bucket.data.content = res;

					// remove the old content
					$("#full-menu").html("");

					compile_data();
				}
				else {
					// error
				}
			});
		}
	});

	// =============================================================
	// INIT
	// =============================================================

	load_data();
	load_templates();
	app_init();

});
