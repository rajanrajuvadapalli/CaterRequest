$(document).ready( function() {

	var bucket = {
		"active_section" : null,
		"data" : {
			"url" : "/cater4party/resources/current-menu.json",
			"ready" : false,
			"content" : null
		},
		"messsages" : {
			// global

			"invalid_min_higher_than_max" : "Minimum quantity cannot be higher than maximum quantity",
			"invalid_max_quantity" : "Invalid product maximum quantity",
			"invalid_min_quantity" : "Invalid product minimum quantity",

			// section specific

			"addition_edit" : {
				"new_addition" : "New Addition <span style=\"color:rgb(40,240,40);\">(new)</span>",
				"empty_ingredients" : "Additions requires at least one ingredient",
				"saved_ok" : "Addition successfully saved",
				"empty_name" : "Addition name is required"
			},

			"product_edit" : {
				"new_product" : "New Product <span style=\"color:rgb(40,240,40);\">(new)</span>",
				"invalid_instructions_ml" : "Invalid instructions maximum characters allowed",
				"empty_name" : "Product name is required",
				"empty_price" : "Product price is required",
				"saved_ok" : "Product successfully saved"
			},

			"category_edit" : {
				"new_category" : "New Category <span style=\"color:rgb(40,240,40);\">(new)</span>",
				"empty_name" : "Category name is required",
				"saved_ok" : "Category successfully saved"
			},

			"popup" : {
				"confirm" : "Are you sure you want to delete this item?",
				"ingredient_in_use" : "Ingredient in use!"
			}
		}
	};

	var templates = {
		"url" : "/cater4party/resources/assets/me-templates/",
		"list" : {
			"ingredient_in_use" : {
				"file"    : "ingredient_in_use.html",
				"content" : null
			},
			"edit_ingredient_list_item" : {
				"file"    : "edit_ingredient_list_item.html",
				"content" : null
			},
			"list_item" : {
				"file"    : "list_item.html",
				"content" : null
			},
			"ingredient_item" : {
				"file"    : "ingredient_item.html",
				"content" : null
			},
			"list_item_existing_additions" : {
				"file"    : "list_item_existing_additions.html",
				"content" : null
			},
			"download_structure_error_categories" : {
				"file" : "download_structure_error_categories.html",
				"content" : null
			},
			"download_structure_error_categories_title" : {
				"file" : "download_structure_error_categories_title.html",
				"content" : null
			},
			"download_structure_error_products_price" : {
				"file" : "download_structure_error_products_price.html",
				"content" : null
			},
			"download_structure_error_products_price_title" : {
				"file" : "download_structure_error_products_price_title.html",
				"content" : null
			}
		}
	};

	var edit_ingredients = {
		"timeout" : 3500,
		"new_ingredient_default_name" : "New Ingredient <span style=\"color:rgb(40,240,40);\">(new)</span>",
		"edit_tid" : null,
		"ingredient_id" : null
	};

	var current_menu = {
		"timeout" : 5000,
		"content" : null,

		"category_id" : null,
		"category_counter" : null,
		"category_edit_tid" : null,

		"product_id" : null,
		"product_counter" : null,
		"product_edit_tid" : null,

		"addition_id" : null,
		"addition_counter" : null,
		"addition_edit_tid" : null,

		"ingredient_counter" : null
	};

	var my_ingredients = {
		"timeout" : 3500,
		"new_ingredient_default_name" : "New Ingredient <span style=\"color:rgb(40,240,40);\">(new)</span>",
		"edit_tid" : null,
		"ingredient_id" : null
	};

	var my_menu = {
		"select_menu_tid" : null,
		"timeout" : 5000,
		"content" : null,

		"category_id" : null,
		"category_counter" : null,
		"category_edit_tid" : null,

		"product_id" : null,
		"product_counter" : null,
		"product_edit_tid" : null,

		"addition_id" : null,
		"addition_counter" : null,
		"addition_edit_tid" : null,

		"ingredient_counter" : null
	};

	var download = {
		tid : null
	};

	// ======================================================================
	// MY MENU
	// ======================================================================

	// compile and display the structure errors - product's price
	function setup_download_strucure_errors_products_price(source) {

		return tmpl_compile_download_structure_errors_products_price(source);
	}

	// compile and display the structure errors - categories
	function setup_download_strucure_errors_categories(source) {

		return tmpl_compile_download_structure_errors_categories(source);
	}

	// update addition ingredients items
	function update_addition_my_ingredients(source, addition_data) {

		var ingredients_data_source = get_ingredients_data(source.ingredients, addition_data.ingredients);
		var ingredients_data = tmpl_compile_ingredient_items(source.ingredients, ingredients_data_source);
		$("#my-menu .addition-edit-ingredients").html(ingredients_data);
	}

	// addition edit show status success
	function addition_edit_mm_show_success(messasge) {

		var obj = $("#my-menu .addition-edit .status-message");

		clearTimeout(my_menu.addition_edit_tid);

		obj.removeClass("error");
		obj.addClass("success");
		obj.html(messasge);

		my_menu.addition_edit_tid = setTimeout( function() {
			obj.html("");
		}, my_menu.timeout);
	}

	// addition edit show status error
	function addition_edit_mm_show_error(messasge) {

		var obj = $("#my-menu .addition-edit .status-message")

		clearTimeout(my_menu.addition_edit_tid);

		obj.addClass("error");
		obj.removeClass("success");
		obj.html(messasge);

		my_menu.addition_edit_tid = setTimeout( function() {
			obj.html("");
		}, my_menu.timeout);
	}

	// addition edit - get all ingredients
	function addition_edit_mm_get_all_ingredients() {

		var ingredients = [];
		var ingredient_id;

		$("#my-menu .addition-edit-ingredients input").each( function() {

			if (true == $(this).prop("checked")) {
				ingredient_id = parseInt($(this).val());
				ingredients.push(ingredient_id);
			}
		});

		return ingredients;
	}

	// set addition arange
	function struct_mm_set_addition_arange(source, id) {

		var addition_ids = [];

		$("#my-menu .product-additions-wrapper [data-id].item").each( function() {

			addition_ids.push($(this).data("id"));
		});

		for (var i in source) {

			if (source[i].id == id) {

				source[i].additions = addition_ids;

				break;
			}
		}
	}

	// update addition ingredients items
	function update_mm_addition_ingredients(source, addition_data) {

		var ingredients_data_source = get_ingredients_data(source.ingredients, addition_data.ingredients);
		var ingredients_data = tmpl_compile_ingredient_items(source.ingredients, ingredients_data_source);
		$("#my-menu .addition-edit-ingredients").html(ingredients_data);
	}

	// setup addition edit section content
	function setup_mm_addition_edit(source, addition_id) {

		// addition basic data
		var addition_data = data_get_addition(source.additions, addition_id);

		// focus and remove the addition name if its new and not modified
		if (addition_data.name == bucket.messsages.addition_edit.new_addition) {
			$("#my-menu .addition-edit-name").val("");
			$("#my-menu .addition-edit-name").focus();
		}
		else {
			$("#my-menu .addition-edit-name").val(addition_data.name);
		}

		$("#my-menu .addition-edit-min").val(addition_data.min == false ? "" : addition_data.min);
		$("#my-menu .addition-edit-max").val(addition_data.max == false ? "" : addition_data.max);
		$("#my-menu .addition-edit input[type=radio][name=addition-type]").each( function() {

			if ($(this).val() == addition_data.type) {
				$(this).prop("checked", true);
			}
			else {
				$(this).prop("checked", false);
			}
		});

		if (typeof(addition_data.pricerange) !== "boolean") {
			addition_data.pricerange = false;
		}
		$("#my-menu .addition-edit input[type=checkbox][name=addition-price-range]").prop("checked", addition_data.pricerange);

		// ingredients
		update_mm_addition_ingredients(source, addition_data);
	}

	// setup existing additions edit section
	function setup_mm_add_remove_existing_additions(source_additions, source_products, product_id) {

		var result_html = "";
		var current_additions;
		var hidden;
		var template = tmpl_get_content("list_item_existing_additions");

		// get all product selected additions
		for (var i in source_products) {

			if (source_products[i].id == product_id) {
				current_additions = source_products[i].additions;
				break;
			}
		}

		// render the additions
		for (var i in source_additions) {

			hidden = "hidden";

			for (var a in current_additions) {

				if (source_additions[i].id == current_additions[a]) {
					hidden = "";
					break;
				}
			}

			result_html += tmpl_render_existing_addition(template, source_additions[i], hidden);
		}

		$("#my-menu .additions-add-remove-existing .product-existing-additions-wrapper").html(result_html);
	}

	// setup add new addition structure
	function setup_mm_add_new_addition() {

		var addition_name = bucket.messsages.addition_edit.new_addition;
		var addition_id = my_menu.addition_counter++;
		struct_add_addition(my_menu.content, addition_name, my_menu.product_id, addition_id);
		var addition_html = tmpl_render_list_item(tmpl_get_content("list_item"), {"id": addition_id, "name": addition_name});
		$("#my-menu .product-additions-wrapper").append(addition_html);

		return addition_id;
	}

	// product edit show status success
	function product_edit_mm_show_success(messasge) {

		var obj = $("#my-menu .product-edit .status-message");

		clearTimeout(my_menu.product_edit_tid);

		obj.removeClass("error");
		obj.addClass("success");
		obj.html(messasge);

		my_menu.product_edit_tid = setTimeout( function() {
			obj.html("");
		}, my_menu.timeout);
	}

	// product edit show status error
	function product_edit_mm_show_error(messasge) {

		var obj = $("#my-menu .product-edit .status-message")

		clearTimeout(my_menu.product_edit_tid);

		obj.addClass("error");
		obj.removeClass("success");
		obj.html(messasge);

		my_menu.product_edit_tid = setTimeout( function() {
			obj.html("");
		}, my_menu.timeout);
	}

	// product edit show status error
	function product_edit_mm_hide_status() {

		clearTimeout(my_menu.product_edit_tid);

		$("#my-menu .product-edit .status-message").html("");
	}

	// setup product edit section content
	function setup_mm_product_edit(source, product_id) {

		// product basic data
		var product_data = data_get_product(source.products, product_id);

		// focus and remove the product name if its new and not modified
		if (product_data.name == bucket.messsages.product_edit.new_product) {
			$("#my-menu .product-edit-name").val("");
			$("#my-menu .product-edit-name").focus();
		}
		else {
			$("#my-menu .product-edit-name").val(product_data.name);
		}

		$("#my-menu .product-edit-price").val(parseFloat(product_data.price).toFixed(2));
		$("#my-menu .product-edit-description").val(product_data.description);
		$("#my-menu .product-edit-min").val(product_data.min == false ? "" : product_data.min);
		$("#my-menu .product-edit-max").val(product_data.max == false ? "" : product_data.max);
		$("#my-menu .product-edit-instructions").val(product_data.instructions.content);
		$("#my-menu .product-edit-instructions-ml").val(product_data.instructions.maxlength == false ? "" : product_data.instructions.maxlength);

		// product additions
		var product_additions_source = data_get_product_additions(source.additions, product_data.additions);
		var product_additions = tmpl_compile_list_item(tmpl_get_content("list_item"), product_additions_source);
		$("#my-menu .product-additions-wrapper").html(product_additions);
	}

	// setup add new product structure
	function setup_mm_add_new_product() {

		var product_name = bucket.messsages.product_edit.new_product;
		var product_id = struct_add_product(my_menu, product_name, my_menu.category_id);
		var product_html = tmpl_render_list_item(tmpl_get_content("list_item"), {"id": product_id, "name": product_name});
		$("#my-menu .category-products-wrapper").append(product_html);

		return product_id;
	}

	// set product arange
	function struct_mm_set_product_arange(source) {

		var product_ids = [];
		var current_temp = [], current = [];
		var others = [];
		var added;

		$("#my-menu .category-products-wrapper [data-id].item").each( function() {

			product_ids.push($(this).data("id"));
		});

		for (var i in source) {
			added = false;

			for (var a in product_ids) {
				if (source[i].id == product_ids[a]) {
					current_temp.push(source[i]);
					added = true;
				}
			}

			if ( ! added) {
				others.push(source[i]);
			}
		}

		for (var a in product_ids) {

			for (var i in current_temp) {
				if (current_temp[i].id == product_ids[a]) {
					current.push(current_temp[i]);
				}
			}
		}

		return current.concat(others);
	}

	// category edit show status success
	function category_edit_mm_show_success(messasge) {

		var obj = $("#my-menu .category-edit .status-message");

		clearTimeout(my_menu.category_edit_tid);

		obj.removeClass("error");
		obj.addClass("success");
		obj.html(messasge);

		my_menu.category_edit_tid = setTimeout( function() {
			obj.html("");
		}, my_menu.timeout);
	}

	// category edit show status error
	function category_edit_mm_show_error(messasge) {

		var obj = $("#my-menu .category-edit .status-message")

		clearTimeout(my_menu.category_edit_tid);

		obj.addClass("error");
		obj.removeClass("success");
		obj.html(messasge);

		my_menu.category_edit_tid = setTimeout( function() {
			obj.html("");
		}, my_menu.timeout);
	}

	// setup category edit section content
	function setup_mm_category_edit(source, category_id) {

		// category basic data
		var category_data = data_get_category(source.categories, category_id);

		// focus and remove the category name if its new and not modified
		if (category_data.name == bucket.messsages.category_edit.new_category) {
			$("#my-menu .category-edit-name").val("");
			$("#my-menu .category-edit-name").focus();
		}
		else {
			$("#my-menu .category-edit-name").val(category_data.name);
		}

		$("#my-menu .category-edit-description").val(category_data.description);

		// category products
		var category_products_source = data_get_category_products(source.products, category_id);
		var category_products = tmpl_compile_list_item(tmpl_get_content("list_item"), category_products_source);
		$("#my-menu .category-products-wrapper").html(category_products);
	}

	// setup add new category structure
	function setup_mm_add_new_category() {

		var category_name = bucket.messsages.category_edit.new_category;
		var category_id = struct_add_category(my_menu, category_name);
		var category_html = tmpl_render_list_item(tmpl_get_content("list_item"), {"id": category_id, "name": category_name});
		$("#my-menu .category-list-wrapper").append(category_html);

		return category_id;
	}

	// setup my menu - use current menu source
	function setup_mm_use_current_menu_source(use_default_ingredients) {

		var content = current_menu.content;

		if (use_default_ingredients == false) {
			content.ingredients = [];
		}

		var category_counter = current_menu.category_counter;
		var product_counter = current_menu.product_counter;
		var addition_counter = current_menu.addition_counter;
		var ingredient_counter = current_menu.ingredient_counter;

		struct_mm_set_initial_content(content, category_counter, product_counter, addition_counter, ingredient_counter);

		setup_edit_my_ingredients();

		setup_mm_category_list();
		show_mm_category_list();
	}

	// setup my menu - new (no source provided)
	function setup_mm_new() {

		var content = {
			"categories" : [],
			"products" : [],
			"additions" : [],
			"ingredients" : []
		};

		var category_counter = 1;
		var product_counter = 1;
		var addition_counter = 1;
		var ingredient_counter = 1;

		struct_mm_set_initial_content(content, category_counter, product_counter, addition_counter, ingredient_counter);

		setup_edit_my_ingredients();

		setup_mm_category_list();
		show_mm_category_list();
	}

	function setup_mm_custom_source(source) {

		var content = source;

		var category_counter = calc_category_counter(content);
		var product_counter = calc_product_counter(content);
		var addition_counter = calc_addition_counter(content);
		var ingredient_counter = calc_ingredient_counter(content);

		struct_mm_set_initial_content(content, category_counter, product_counter, addition_counter, ingredient_counter);

		setup_edit_my_ingredients();

		setup_mm_category_list();
		show_mm_category_list();
	}

	// show mm select source error
	function show_mm_select_source_error(message) {

		$("#mm-select-source-error").html(message);
	}

	// hide mm select source error
	function hide_mm_select_source_error(message) {

		$("#mm-select-source-error").html("");
	}

	// setup category list
	function setup_mm_category_list() {

		// render
		var category_list_items = tmpl_compile_list_item(tmpl_get_content("list_item"), my_menu.content.categories);

		// put into the DOM
		$("#my-menu .category-list-wrapper").html(category_list_items);
	}

	// show existing additions
	function show_mm_existing_additions() {

		$("#my-menu .additions-add-remove-existing").removeClass("hidden");
	}

	// hide existing additions
	function hide_mm_existing_additions() {

		$("#my-menu .additions-add-remove-existing").addClass("hidden");
	}

	// show select source section
	function show_mm_select_source() {

		$("#mm-select-source").removeClass("hidden");
	}

	// hide select source section
	function hide_mm_select_source() {

		$("#mm-select-source").addClass("hidden");
	}

	// show category list section
	function show_mm_category_list() {

		$("#my-menu .category-list").removeClass("hidden");
	}

	// hide category list section
	function hide_mm_category_list() {

		$("#my-menu .category-list").addClass("hidden");
	}

	// show category edit section
	function show_mm_category_edit() {

		$("#my-menu .category-edit").removeClass("hidden");
	}

	// hide category edit section
	function hide_mm_category_edit() {

		$("#my-menu .category-edit").addClass("hidden");
	}

	// show product edit
	function show_mm_product_edit() {

		$("#my-menu .product-edit").removeClass("hidden");
	}

	// hide product edit
	function hide_mm_product_edit() {

		$("#my-menu .product-edit").addClass("hidden");
	}

	// show addition edit
	function show_mm_addition_edit() {

		$("#my-menu .addition-edit").removeClass("hidden");
	}

	// hide addition edit
	function hide_mm_addition_edit() {

		$("#my-menu .addition-edit").addClass("hidden");
	}

	// make new menu (use currnet menu source)
	$("#mm-use-current-menu").on({
		click: function() {

			popup_init({
				yes : function() {

					setup_mm_use_current_menu_source(true);

					hide_mm_select_source();

					check_download_state();
				},
				no : function() {

					setup_mm_use_current_menu_source(false);

					hide_mm_select_source();

					check_download_state();
				},
				"message" : "Do you want to import the ingredients from the Base Menu?",
				"title" : "Ingredients' source selection",
				"no_name" : "No",
				"yes_default_color" : true
			});
		}
	});

	// make new menu (no source provided)
	$("#mm-make-new-menu").on({
		click: function() {

			setup_mm_new();

			hide_mm_select_source();

			check_download_state();
		}
	});

	// use file as base source
	$("#mm-use-custom-source").on({
		change: function() {

			var content = $(this)[0].files[0];
			$(this).val("");

			if (typeof(content) === "undefined") {
				return;
			}

			var form_data = new FormData();
			form_data.append("customMenuSource", content);

			$.ajax({
				url: "/cater4party/menueditor/uploadCustomeMenuSource",
				method: "POST",
				dataType: "text",
				data: form_data,
				processData: false,
				contentType: false,
				cache: false,
				error: function() { console.error("Ajax call failed!"); },
				success: function(res) {
					// console.log(res);

					if (res !== 1) {
						// ok
						try {
							res = JSON.parse(res);
						}
						catch(e) {
							show_mm_select_source_error("Invalid menu source");
							return;
						}

						// no validation (new)
						setup_mm_custom_source(res);

						hide_mm_select_source_error();
						hide_mm_select_source();

						check_download_state();
					}
					else {
						// error
					}
				}
			});
		}
	});

	// (category-list) New Category Button
	$("#my-menu .category-list-new-category").on({
		click: function() {

			var category_id = setup_mm_add_new_category();

			$("#my-menu .category-list [data-id=" +category_id+ "].item .action.edit").click();

			// check_download_state();
		}
	});

	// My Menu home screen - Back button
	$("#my-menu .category-list .action-button.back").on({
		click: function() {

			popup_init({
				yes : function() {

					my_menu.content = null;

					disable_my_ingredients_mm_button();

					hide_mm_category_list();
					show_mm_select_source();

					check_download_state();
				},
				"message" : "Are you sure you want to discard changes?",
				"title" : "Confirmation"
			});
		}
	});

	// (category-list) Action Edit
	$(document).on({
		click: function() {

			show_mm_category_edit();
			hide_mm_category_list();

			my_menu.category_id = $(this).closest("[data-id]").data("id");
			setup_mm_category_edit(my_menu.content, my_menu.category_id);
		}
	}, "#my-menu .category-list .item .action.edit");

	// (category-edit) Back Button
	$("#my-menu .category-edit .action-button.back").on({
		click: function() {
			hide_mm_category_edit();
			show_mm_category_list();
		}
	});

	// (category-edit) Save Button
	$("#my-menu .category-edit .action-button.update").on({
		click: function() {

			var name = $("#my-menu .category-edit-name").val().trim();
			var description = $("#my-menu .category-edit-description").val().trim();

			if (name == "") {
				category_edit_mm_show_error(bucket.messsages.category_edit.empty_name);
				return;
			}

			// show success and hide error
			category_edit_mm_show_success(bucket.messsages.category_edit.saved_ok);

			// store the values
			struct_update_category_data(my_menu.content, my_menu.category_id, name, description);

			// update the list item name
			$("#my-menu .category-list-wrapper [data-id=" + my_menu.category_id + "] .title").html(name);

			// check_download_state();
		}
	});

	// (category-edit) Action Delete
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-id]");
			var product_id = obj.data("id");

			popup_init({
				yes : function() {
					obj.remove();
					struct_remove_product(my_menu.content.products, product_id);

					// check_download_state();
				}
			});
		}
	}, "#my-menu .category-edit .item .action.delete");

	// (category-list) "Up" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_up($("#my-menu .category-list-wrapper"), id);

			my_menu.content.categories = struct_set_category_arange(my_menu.content.categories);
		}
	}, "#my-menu .category-list-wrapper .action.up");

	// (category-list) "Down" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_down($("#my-menu .category-list-wrapper"), id);

			my_menu.content.categories = struct_set_category_arange(my_menu.content.categories);
		}
	}, "#my-menu .category-list-wrapper .action.down");

	// (category-edit) "Up" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_up($("#my-menu .category-products-wrapper"), id);

			my_menu.content.products = struct_mm_set_product_arange(my_menu.content.products);
		}
	}, "#my-menu .category-products-wrapper .action.up");

	// (category-edit) "Down" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_down($("#my-menu .category-products-wrapper"), id);

			my_menu.content.products = struct_mm_set_product_arange(my_menu.content.products);
		}
	}, "#my-menu .category-products-wrapper .action.down");

	// (category-list) Action Delete
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-id]");
			var category_id = obj.data("id");

			popup_init({
				yes : function() {
					obj.remove();
					struct_remove_category(my_menu.content.categories, category_id);
					struct_remove_category_products(my_menu.content.products, category_id);

					// check_download_state();
				}
			});
		}
	}, "#my-menu .category-list .item .action.delete");

	// (category-edit) New Product Button
	$("#my-menu .category-edit-new-product").on({
		click: function() {

			var product_id = setup_mm_add_new_product();

			$("#my-menu .category-edit [data-id=" +product_id+ "].item .action.edit").click();
		}
	});

	// (category-edit) Product Edit
	$(document).on({
		click: function() {

			hide_mm_category_edit();
			show_mm_product_edit();

			my_menu.product_id = $(this).closest("[data-id]").data("id");
			setup_mm_product_edit(my_menu.content, my_menu.product_id);
		}
	}, "#my-menu .category-edit .action.edit");

	// (product-edit) Back Button
	$("#my-menu .product-edit .action-button.back").on({
		click: function() {

			show_mm_category_edit();
			hide_mm_product_edit();
		}
	});

	// (product-edit) Save Button
	$("#my-menu .product-edit .action-button.update").on({
		click: function() {

			var name = $("#my-menu .product-edit-name").val().trim();
			var price = $("#my-menu .product-edit-price").val().trim();
			var description = $("#my-menu .product-edit-description").val().trim();
			var min_quantity = $("#my-menu .product-edit-min").val().trim();
			var max_quantity = $("#my-menu .product-edit-max").val().trim();
			var instructions = $("#my-menu .product-edit-instructions").val().trim();
			var instructions_ml = $("#my-menu .product-edit-instructions-ml").val().trim();

			if (name == "") {
				product_edit_mm_show_error(bucket.messsages.product_edit.empty_name);
				return;
			}

			if (price == "") {
				product_edit_mm_show_error(bucket.messsages.product_edit.empty_price);
				return;
			}
			price = parseFloat(price);

			if (min_quantity != "") {
				if (false == is_integer_valid(min_quantity)) {
					product_edit_mm_show_error(bucket.messsages.invalid_min_quantity);
					return;
				}
				min_quantity = parseInt(min_quantity);
				if (min_quantity == 0) {
					min_quantity = false;
				}
			}
			else {
				min_quantity = false;
			}

			if (max_quantity != "") {
				if (false == is_integer_valid(max_quantity)) {
					product_edit_mm_show_error(bucket.messsages.invalid_max_quantity);
					return;
				}
				max_quantity = parseInt(max_quantity);
				if (max_quantity == 0) {
					max_quantity = false;
				}
			}
			else {
				max_quantity = false;
			}

			if (min_quantity != false && max_quantity !== false) {
				if (min_quantity > max_quantity) {
					product_edit_mm_show_error(bucket.messsages.invalid_min_higher_than_max);
					return;
				}
			}

			if (instructions_ml != "") {
				if (false == is_integer_valid(instructions_ml)) {
					product_edit_mm_show_error(bucket.messsages.product_edit.invalid_instructions_ml);
					return;
				}
				instructions_ml = parseInt(instructions_ml);
				if (instructions_ml == 0) {
					instructions_ml = false;
				}
			}
			else {
				instructions_ml = false;
			}

			// show success and hide error
			product_edit_mm_show_success(bucket.messsages.product_edit.saved_ok);

			// store the values
			struct_update_product_data(my_menu.content, my_menu.product_id, name, price, description, min_quantity, max_quantity, instructions, instructions_ml);

			// update the list item name
			$("#my-menu .category-products-wrapper [data-id=" + my_menu.product_id + "] .title").html(name);

			// check_download_state();
		}
	});

	// (product-edit) New Addition Button
	$("#my-menu .product-edit-new-addition").on({
		click: function() {

			var addition_id = setup_mm_add_new_addition();

			$("#my-menu .product-edit [data-id=" +addition_id+ "].item .action.edit").click();
		}
	});

	// (product-edit) Add/Remove Existing Additions Button
	$("#my-menu .product-edit-add-remove-existing-additions").on({
		click: function() {

			setup_mm_add_remove_existing_additions(my_menu.content.additions, my_menu.content.products, my_menu.product_id);

			show_mm_existing_additions();
			hide_mm_product_edit();
		}
	});

	// (add/remove existing additions) Back Button
	$("#my-menu .additions-add-remove-existing .action-button.back").on({
		click: function() {

			var product_data = data_get_product(my_menu.content.products, my_menu.product_id);
			var product_additions_source = data_get_product_additions(my_menu.content.additions, product_data.additions);
			var product_additions = tmpl_compile_list_item(tmpl_get_content("list_item"), product_additions_source);
			$("#my-menu .product-additions-wrapper").html(product_additions);

			hide_mm_existing_additions();
			show_mm_product_edit();

			// check_download_state();
		}
	});

	// (add/remove existing additions) Add/Remove Button
	$(document).on({
		click: function() {

			var addition_id = $(this).data("id");
			var selected = $(this).find(".added");
			// currently not selected
			// make it selected
			if (selected.hasClass("hidden")) {
				selected.removeClass("hidden");
				selected = true;
			}
			// currently selected
			// make it not selected
			else {
				selected.addClass("hidden");
				selected = false;
			}
			struct_toggle_product_addition(my_menu.content.products, my_menu.product_id, addition_id, selected);
		}
	}, "#my-menu .additions-add-remove-existing .product-existing-additions-wrapper [data-id].item");

	// (product-edit) Action Edit
	$(document).on({
		click: function() {

			hide_mm_product_edit();
			show_mm_addition_edit();

			my_menu.addition_id = $(this).closest("[data-id]").data("id");
			setup_mm_addition_edit(my_menu.content, my_menu.addition_id);

			// update my menu - addition ingredients data
			if (my_menu.addition_id !== null) {
				update_mm_addition_ingredients(my_menu.content, data_get_addition(my_menu.content.additions, my_menu.addition_id));
			}
		}
	}, "#my-menu .product-edit .action.edit");

	// (product-edit) Action Delete
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-id]");
			var addition_id = obj.data("id");

			popup_init({
				yes : function() {
					obj.remove();
					struct_remove_addition(my_menu.content.products, my_menu.product_id, addition_id);

					// check_download_state();
				}
			});
		}
	}, "#my-menu .product-edit .item .action.delete");

	// (product-edit) "Down" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_down($("#my-menu .product-additions-wrapper"), id);

			struct_mm_set_addition_arange(my_menu.content.products, my_menu.product_id);
		}
	}, "#my-menu .product-additions-wrapper .action.down");

	// (product-edit) "Up" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_up($("#my-menu .product-additions-wrapper"), id);

			struct_mm_set_addition_arange(my_menu.content.products, my_menu.product_id);
		}
	}, "#my-menu .product-additions-wrapper .action.up");

	// (addition-edit) Back Button
	$("#my-menu .addition-edit .action-button.back").on({
		click: function() {

			hide_mm_addition_edit();
			show_mm_product_edit();
		}
	});

	// (addition-edit) Save Button
	$("#my-menu .addition-edit .action-button.update").on({
		click: function() {

			var name = $("#my-menu .addition-edit-name").val().trim();
			var min_quantity = $("#my-menu .addition-edit-min").val().trim();
			var max_quantity = $("#my-menu .addition-edit-max").val().trim();
			var type = $("#my-menu .addition-edit [name=addition-type]:checked").val();
			var price_range = $("#my-menu .addition-edit [name=addition-price-range]").prop("checked");
			var ingredients = addition_edit_mm_get_all_ingredients();

			if (name == "") {
				addition_edit_mm_show_error(bucket.messsages.addition_edit.empty_name);
				return;
			}

			if (min_quantity != "") {
				if (false == is_integer_valid(min_quantity)) {
					addition_edit_mm_show_error(bucket.messsages.invalid_min_quantity);
					return;
				}
				min_quantity = parseInt(min_quantity);
				if (min_quantity == 0) {
					min_quantity = false;
				}
			}
			else {
				min_quantity = false;
			}

			if (max_quantity != "") {
				if (false == is_integer_valid(max_quantity)) {
					addition_edit_mm_show_error(bucket.messsages.invalid_max_quantity);
					return;
				}
				max_quantity = parseInt(max_quantity);
				if (max_quantity == 0) {
					max_quantity = false;
				}
			}
			else {
				max_quantity = false;
			}

			if (min_quantity != false && max_quantity !== false) {
				if (min_quantity > max_quantity) {
					addition_edit_mm_show_error(bucket.messsages.invalid_min_higher_than_max);
					return;
				}
			}

			if (type !== "text" && ingredients.length == 0) {
				addition_edit_mm_show_error(bucket.messsages.addition_edit.empty_ingredients);
				return;
			}

			// show success and hide error
			addition_edit_mm_show_success(bucket.messsages.addition_edit.saved_ok);

			// store the values
			struct_update_addition_data(my_menu.content, my_menu.addition_id, name, min_quantity, max_quantity, type, price_range, ingredients);

			// update the list item name
			$("#my-menu .product-additions-wrapper [data-id=" + my_menu.addition_id + "] .title").html(name);

			// check_download_state();
		}
	});

	// ======================================================================
	// MY INGREDIENTS
	// ======================================================================

	// init edit ingredients
	function setup_edit_my_ingredients() {

		// enable the button in the main menu
		enable_my_ingredients_mm_button();

		// render
		var ingredients_list_items = tmpl_compile_list_item(tmpl_get_content("edit_ingredient_list_item"), my_menu.content.ingredients);

		// put into the DOM
		$("#my-ingredients-list-wrapper").html(ingredients_list_items);
	}

	function setup_my_ingredient_edit(source, ingredient_id) {

		// ingredient basic data
		var ingredient_data = data_get_ingredient(source, ingredient_id);

		// focus and remove the ingredient name if its new and not modified
		if (ingredient_data.name == my_ingredients.new_ingredient_default_name) {
			$("#my-ingredients-edit-name").val("");
			$("#my-ingredients-edit-name").focus();
		}
		else {
			$("#my-ingredients-edit-name").val(ingredient_data.name);
		}

		$("#my-ingredients-edit-price").val(ingredient_data.price);
	}

	function my_ingredient_edit_show_success(messasge) {

		var obj = $("#my-ingredients-edit .status-message");

		clearTimeout(my_ingredients.edit_tid);

		obj.removeClass("error");
		obj.addClass("success");
		obj.html(messasge);

		my_ingredients.edit_tid = setTimeout( function() {
			obj.html("");
		}, my_ingredients.timeout);
	}

	function my_ingredient_edit_show_error(messasge) {

		var obj = $("#my-ingredients-edit .status-message");

		clearTimeout(my_ingredients.edit_tid);

		obj.addClass("error");
		obj.removeClass("success");
		obj.html(messasge);

		my_ingredients.edit_tid = setTimeout( function() {
			obj.html("");
		}, my_ingredients.timeout);
	}

	// show ingredient edit
	function show_my_ingredient_edit() {

		$("#my-ingredients-edit").removeClass("hidden");
	}

	// hide ingredient edit
	function hide_my_ingredient_edit() {

		$("#my-ingredients-edit").addClass("hidden");
	}

	// show ingredient list
	function show_my_ingredient_list() {

		$("#my-ingredients-list").removeClass("hidden");
	}

	// hide ingredient list
	function hide_my_ingredient_list() {

		$("#my-ingredients-list").addClass("hidden");
	}

	// filter show only
	function edit_my_ingredients_show_only(search) {

		var name;

		$("#my-ingredients-list-wrapper .item").each( function() {

			name = $(this).find(".title").html().trim().toLowerCase();

			if (name.indexOf(search) !== -1) {
				$(this).removeClass("hidden");
			}
			else {
				$(this).addClass("hidden");
			}
		});
	}

	// filter show all
	function edit_my_ingredients_show_all() {

		$("#my-ingredients-list-wrapper .item").each( function() {
			$(this).removeClass("hidden");
		});
	}

	// setup add new my ingredient structure
	function setup_add_new_my_ingredient() {

		var name = my_ingredients.new_ingredient_default_name;
		var id = struct_add_ingredient(my_menu, name);
		var html = tmpl_render_list_item(tmpl_get_content("edit_ingredient_list_item"), {"id": id, "name": name});
		$("#my-ingredients-list-wrapper").append(html);

		$("#my-ingredients-list-wrapper [data-id=" +id+ "].item .action.edit").click();
	}

	// edit ingredient back button
	$("#my-ingredients-edit .action-button.back").on({
		click: function() {

			// return
			hide_my_ingredient_edit();
			show_my_ingredient_list();
		}
	});

	// edit ingredient save button
	$("#my-ingredients-edit .action-button.update").on({
		click: function() {

			// name
			var name = $("#my-ingredients-edit-name").val().trim();
			if (name == "") {
				my_ingredient_edit_show_error("Ingredient name is required");
				return;
			}

			// price
			var price = $("#my-ingredients-edit-price").val().trim();
			if (price == "") {
				price = 0;
			}
			else if (false == is_number_valid(price)) {
				my_ingredient_edit_show_error("Invalid price value");
				return;
			}

			// formating
			price = (price !== 0) ? parseFloat(price) : 0;

			// hide the error (if any)
			my_ingredient_edit_show_success("Ingredient successfully saved");

			// store the values
			struct_update_ingredient_data(my_menu.content, my_ingredients.ingredient_id, name, price);

			// update the list item name
			$("#my-ingredients-list-wrapper [data-id=" + my_ingredients.ingredient_id + "] .title").html(name);

			// update my menu - addition ingredients data
			if (my_menu.addition_id !== null) {
				update_addition_my_ingredients(my_menu.content, data_get_addition(my_menu.content.additions, my_menu.addition_id));
			}
		}
	});

	// edit ingredient back button
	$("#ingredients-edit .action-button.back").on({
		click: function() {

			// return
			hide_ingredient_edit();
			show_ingredient_list();
		}
	});

	// filter
	$("#my-ingredients-list-filter").on({
		keyup: function() {

			var value = $(this).val().trim();

			if (value == "") {
				edit_my_ingredients_show_all();
				return;
			}

			edit_my_ingredients_show_only(value.toLowerCase());
		}
	});

	// reset filter
	$("#my-ingredients-list-reset-filter").on({
		click: function() {

			$("#my-ingredients-list-filter").val("");
			edit_my_ingredients_show_all();
		}
	});

	// add new ingredient
	$("#my-ingredients-list-new-ingredient").on({
		click: function() {

			setup_add_new_my_ingredient();
		}
	});

	// edit ingredient
	$(document).on({
		click: function() {

			hide_my_ingredient_list();
			show_my_ingredient_edit();

			my_ingredients.ingredient_id = $(this).closest("[data-id]").data("id");
			setup_my_ingredient_edit(my_menu.content.ingredients, my_ingredients.ingredient_id);
		}
	}, "#my-ingredients-list-wrapper .item .action.edit");

	// delete ingredient
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-id]");
			var ingredient_id = obj.data("id");
			var message;
			var remove_from_additions;

			if (true == struct_is_ingredient_in_use(my_menu, ingredient_id)) {
				message = popup_get_warn_message();
				remove_from_additions = true;
			}
			else {
				message = bucket.messsages.popup.confirm;
				remove_from_additions = false;
			}

			popup_init({
				yes : function() {
					obj.remove();
					struct_remove_ingredient(my_menu.content, ingredient_id, remove_from_additions);

					// update current menu - addition ingredients data
					if (my_menu.addition_id !== null) {
						update_addition_ingredients(my_menu.content, data_get_addition(my_menu.content.additions, my_menu.addition_id));
					}
				},
				message : message
			});
		}
	}, "#my-ingredients-list-wrapper .item .action.delete");

	// ======================================================================
	// EDIT INGREDIENTS
	// ======================================================================

	// init edit ingredients
	function setup_edit_ingredients() {

		// render
		var ingredients_list_items = tmpl_compile_list_item(tmpl_get_content("edit_ingredient_list_item"), current_menu.content.ingredients);

		// put into the DOM
		$("#ingredients-list-wrapper").html(ingredients_list_items);
	}

	// filter show only
	function edit_ingredients_show_only(search) {

		var name;

		$("#ingredients-list-wrapper .item").each( function() {

			name = $(this).find(".title").html().trim().toLowerCase();

			if (name.indexOf(search) !== -1) {
				$(this).removeClass("hidden");
			}
			else {
				$(this).addClass("hidden");
			}
		});
	}

	// filter show all
	function edit_ingredients_show_all() {

		$("#ingredients-list-wrapper .item").each( function() {
			$(this).removeClass("hidden");
		});
	}

	// show ingredient list
	function show_ingredient_list() {

		$("#ingredients-list").removeClass("hidden");
	}

	// hide ingredient list
	function hide_ingredient_list() {

		$("#ingredients-list").addClass("hidden");
	}

	// show ingredient edit
	function show_ingredient_edit() {

		$("#ingredients-edit").removeClass("hidden");
	}

	// hide ingredient edit
	function hide_ingredient_edit() {

		$("#ingredients-edit").addClass("hidden");
	}

	function setup_ingredient_edit(source, ingredient_id) {

		// ingredient basic data
		var ingredient_data = data_get_ingredient(source, ingredient_id);

		// focus and remove the ingredient name if its new and not modified
		if (ingredient_data.name == edit_ingredients.new_ingredient_default_name) {
			$("#ingredients-edit-name").val("");
			$("#ingredients-edit-name").focus();
		}
		else {
			$("#ingredients-edit-name").val(ingredient_data.name);
		}

		$("#ingredients-edit-price").val(ingredient_data.price);
	}

	function ingredient_edit_show_success(messasge) {

		var obj = $("#ingredients-edit .status-message");

		clearTimeout(edit_ingredients.edit_tid);

		obj.removeClass("error");
		obj.addClass("success");
		obj.html(messasge);

		edit_ingredients.edit_tid = setTimeout( function() {
			obj.html("");
		}, edit_ingredients.timeout);
	}

	function ingredient_edit_show_error(messasge) {

		var obj = $("#ingredients-edit .status-message");

		clearTimeout(edit_ingredients.edit_tid);

		obj.addClass("error");
		obj.removeClass("success");
		obj.html(messasge);

		edit_ingredients.edit_tid = setTimeout( function() {
			obj.html("");
		}, edit_ingredients.timeout);
	}

	function ingredient_edit_hide_status() {

		clearTimeout(edit_ingredients.edit_tid);

		$("#ingredients-edit .status-message").html("");
	}

	// setup add new ingredient structure
	function setup_add_new_ingredient() {

		var name = edit_ingredients.new_ingredient_default_name;
		var id = struct_add_ingredient(current_menu, name);
		var html = tmpl_render_list_item(tmpl_get_content("edit_ingredient_list_item"), {"id": id, "name": name});
		$("#ingredients-list-wrapper").append(html);

		$("#ingredients-list-wrapper [data-id=" +id+ "].item .action.edit").click();
	}

	// add new ingredient
	$("#ingredients-list-new-ingredient").on({
		click: function() {

			setup_add_new_ingredient();
		}
	});

	// edit ingredient save button
	$("#ingredients-edit .action-button.update").on({
		click: function() {

			// name
			var name = $("#ingredients-edit-name").val().trim();
			if (name == "") {
				ingredient_edit_show_error("Ingredient name is required");
				return;
			}

			// price
			var price = $("#ingredients-edit-price").val().trim();
			if (price == "") {
				price = 0;
			}
			else if (false == is_number_valid(price)) {
				ingredient_edit_show_error("Invalid price value");
				return;
			}

			// formating
			price = (price !== 0) ? parseFloat(price) : 0;

			// hide the error (if any)
			ingredient_edit_show_success("Ingredient successfully saved");

			// store the values
			struct_update_ingredient_data(current_menu.content, edit_ingredients.ingredient_id, name, price);

			// update the list item name
			$("#ingredients-list-wrapper [data-id=" + edit_ingredients.ingredient_id + "] .title").html(name);

			// update current menu - addition ingredients data
			if (current_menu.addition_id !== null) {
				update_addition_ingredients(current_menu.content, data_get_addition(current_menu.content.additions, current_menu.addition_id));
			}

			// update my menu - addition ingredients data
			/*
			if (my_menu.addition_id !== null) {
				update_mm_addition_ingredients(my_menu.content, data_get_addition(my_menu.content.additions, my_menu.addition_id));
			}
			*/

			// update current menu source
			update_current_menu_source();
		}
	});

	// edit ingredient back button
	$("#ingredients-edit .action-button.back").on({
		click: function() {

			// return
			hide_ingredient_edit();
			show_ingredient_list();
		}
	});

	// edit ingredient
	$(document).on({
		click: function() {

			hide_ingredient_list();
			show_ingredient_edit();

			edit_ingredients.ingredient_id = $(this).closest("[data-id]").data("id");
			setup_ingredient_edit(current_menu.content.ingredients, edit_ingredients.ingredient_id);
		}
	}, "#ingredients-list-wrapper .item .action.edit");

	// delete ingredient
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-id]");
			var ingredient_id = obj.data("id");
			var message;
			var remove_from_additions;

			if (true == struct_is_ingredient_in_use(current_menu, ingredient_id)) {
				message = popup_get_warn_message();
				remove_from_additions = true;
			}
			else {
				message = bucket.messsages.popup.confirm;
				remove_from_additions = false;
			}

			popup_init({
				yes : function() {
					obj.remove();
					struct_remove_ingredient(current_menu.content, ingredient_id, remove_from_additions);

					// update current menu - addition ingredients data
					if (current_menu.addition_id !== null) {
						update_addition_ingredients(current_menu.content, data_get_addition(current_menu.content.additions, current_menu.addition_id));
					}

					// update my menu - addition ingredients data
					/*
					if (my_menu.addition_id !== null) {
						update_mm_addition_ingredients(my_menu.content, data_get_addition(my_menu.content.additions, my_menu.addition_id));
					}
					*/

					// update current menu source
					update_current_menu_source();
				},
				message : message
			});
		}
	}, "#ingredients-list-wrapper .item .action.delete");

	// filter
	$("#ingredients-list-filter").on({
		keyup: function() {

			var value = $(this).val().trim();

			if (value == "") {
				edit_ingredients_show_all();
				return;
			}

			edit_ingredients_show_only(value.toLowerCase());
		}
	});

	// reset filter
	$("#ingredients-list-reset-filter").on({
		click: function() {

			$("#ingredients-list-filter").val("");
			edit_ingredients_show_all();
		}
	});

	// ======================================================================
	// STRUCTURE
	// ======================================================================

	// remove all unused data from a menu data structure
	function struct_clean_up(source) {

		var category_id;

		var categories = [];
		var products = [];
		var products_counter;
		var additions = [];
		var additions_tmp = [];
		var addition_exist;
		var ingredients = [];
		var ingredients_tmp = [];
		var ingredient_exist;
		var empty_categories = [];
		var empty_products = [];

		// iterate through all categories
		for (var cat in source.categories) {

			category_id = source.categories[cat].id;
			products_counter = 0;

			// iterate through all products in the current category
			for (var pro in source.products) {

				if (source.products[pro].category == category_id) {
					products_counter++;
					products.push(source.products[pro]);

					// get all unique additions
					for (var add in source.products[pro].additions) {

						addition_exist = false;

						for (var add_tmp in additions_tmp) {
							if (additions_tmp[add_tmp] == source.products[pro].additions[add]) {
								addition_exist = true;
							}
						}

						if ( ! addition_exist) {
							additions_tmp.push(source.products[pro].additions[add]);
						}
					}

					// product with price of 0 ?
					if (source.products[pro].price == 0) {

						var category_data = data_get_category(source.categories, source.products[pro].category);

						empty_products.push({
							"product_name" : source.products[pro].name,
							"category_name" : category_data.name
						});
					}
				}
			}

			if (products_counter > 0) {
				categories.push(source.categories[cat]);
			}
			else {
				empty_categories.push(source.categories[cat].name);
			}
		}

		// extract only usable additions
		for (var i in source.additions) {
			for (var add in additions_tmp) {
				if (additions_tmp[add] == source.additions[i].id) {
					additions.push(source.additions[i]);

					// get all unique ingredients
					for (var a in source.additions[i].ingredients) {

						ingredient_exist = false;

						for (var ing in ingredients_tmp) {
							if (ingredients_tmp[ing] == source.additions[i].ingredients[a]) {
								ingredient_exist = true;
							}
						}

						if ( ! ingredient_exist) {
							ingredients_tmp.push(source.additions[i].ingredients[a]);
						}
					}
				}
			}
		}

		// extract only usable ingredients
		for (var i in source.ingredients) {
			for (var add in ingredients_tmp) {
				if (ingredients_tmp[add] == source.ingredients[i].id) {
					ingredients.push(source.ingredients[i]);
				}
			}
		}

		return [categories, products, additions, ingredients, empty_categories, empty_products];
	}

	// calculate the ingredient counter
	function calc_ingredient_counter(source) {

		var ids = [];
		for (var i in source.ingredients) {
			ids.push(source.ingredients[i].id);
		}

		if (ids.length > 0) {
			ingredient_id = Array.max(ids);
			ingredient_id++;
		}
		else {
			ingredient_id = 1;
		}

		return ingredient_id;
	}

	// calculate the addition counter
	function calc_addition_counter(source) {

		var ids = [];
		for (var i in source.additions) {
			ids.push(source.additions[i].id);
		}

		if (ids.length > 0) {
			addition_id = Array.max(ids);
			addition_id++;
		}
		else {
			addition_id = 1;
		}

		return addition_id;
	}

	// calculate the product counter
	function calc_product_counter(source) {

		var ids = [];
		for (var i in source.products) {
			ids.push(source.products[i].id);
		}

		if (ids.length > 0) {
			product_id = Array.max(ids);
			product_id++;
		}
		else {
			product_id = 1;
		}

		return product_id;
	}

	// calculate the category counter
	function calc_category_counter(source) {

		var ids = [];
		for (var i in source.categories) {
			ids.push(source.categories[i].id);
		}
		if (ids.length > 0) {
			category_id = Array.max(ids);
			category_id++;
		}
		else {
			category_id = 1;
		}

		return category_id;
	}

	// validate json structure (full, must include valida data)
	function struct_validate_full(source) {

		// validate base structure
		var valid_base_structure = struct_validate(source);
		if (true !== valid_base_structure) {
			return valid_base_structure;
		}

		var structure_error = "Invalid data!";

		// validate
		try {

			// not empty
			// if (source.categories.length == 0 || source.products.length == 0 || source.additions.length == 0 || source.ingredients.length == 0) {
			// if (source.categories.length == 0 || source.products.length == 0) {
				// throw new Error(structure_error);
			// }

			// categories

			if (source.categories.length == 0) {
				throw new Error(structure_error);
			}

			var category_id;
			var products_counter;

			for (var i in source.categories) {

				category_id = source.categories[i].id;
				products_counter = 0;

				// products
				for (var a in source.products) {
					if (source.products[a].category == category_id) {
						products_counter++;

						// additions
						// note: additions are not required
						if (source.products[a].additions.length > 0) {

							var addition_ok;
							var ingredient_ok;

							for (var b in source.products[a].additions) {

								addition_ok = false;

								for (var c in source.additions) {
									if (source.additions[c].id == source.products[a].additions[b]) {
										addition_ok = true;

										// ingredients
										// note: if the addition type is "text", no ingredients are required
										if (source.additions[c].type == "text") {
											break;
										}

										// validate ingredients
										for (var d in source.additions[c].ingredients) {

											ingredient_ok = false;

											for (var e in source.ingredients) {
												if (source.ingredients[e].id == source.additions[c].ingredients[d]) {
													ingredient_ok = true;
													break;
												}
											}

											if (false == ingredient_ok) {
												throw new Error(structure_error);
											}
										}

										break;
									}
								}

								if (false == addition_ok) {
									throw new Error(structure_error);
								}
							}
						}
					}
				}

				if (products_counter == 0) {
					throw new Error(structure_error);
				}
			}
		}
		catch (e) {
			return e.message;
		}

		return true;
	}

	// validate json data structure
	function struct_validate(source) {

		var structure_error = "Invalid structure!";

		// validate
		try {

			// main

			if (typeof(source) !== "object") {
				throw new Error(structure_error + " : 1");
			}

			// ------------------------------------------
			// categories

			if (typeof(source.categories) !== "object") {
				throw new Error(structure_error + " : 2");
			}

			if (source.categories.length > 0) {
				for (var i in source.categories) {

					// element key
					if (typeof(i) !== "string" || ! /^\d+$/.test(i)) {
						throw new Error(structure_error + " : 3");
					}

					// id
					if (typeof(source.categories[i].id) !== "number") {
						throw new Error(structure_error + " : 4");
					}

					// name
					if (typeof(source.categories[i].name) !== "string") {
						throw new Error(structure_error + " : 5");
					}

					// description
					if (typeof(source.categories[i].description) !== "string") {
						throw new Error(structure_error + " : 6");
					}
				}
			}

			// ------------------------------------------
			// products

			if (typeof(source.products) !== "object") {
				throw new Error(structure_error + " : 7");
			}

			if (source.products.length > 0) {
				for (var i in source.products) {

					// element key
					if (typeof(i) !== "string" || ! /^\d+$/.test(i)) {
						throw new Error(structure_error + " : 8");
					}

					// category
					if (typeof(source.products[i].category) !== "number") {
						throw new Error(structure_error + " : 9");
					}

					// id
					if (typeof(source.products[i].id) !== "number") {
						throw new Error(structure_error + " : 10");
					}

					// name
					if (typeof(source.products[i].name) !== "string") {
						throw new Error(structure_error + " : 11");
					}

					// price
					if (typeof(source.products[i].price) !== "number") {
						throw new Error(structure_error + " : 12");
					}

					// description
					if (typeof(source.products[i].description) !== "string") {
						throw new Error(structure_error + " : 13");
					}

					// min
					if (typeof(source.products[i].min) !== "boolean" && typeof(source.products[i].min) !== "number") {
						throw new Error(structure_error + " : 14");
					}

					// max
					if (typeof(source.products[i].max) !== "boolean" && typeof(source.products[i].max) !== "number") {
						throw new Error(structure_error + " : 15");
					}

					// additions and addition ids
					if (typeof(source.products[i].additions) !== "object") {
						throw new Error(structure_error + " : 16");
					}
					for (var a in source.products[i].additions) {
						if (typeof(source.products[i].additions[a]) !== "number") {
							throw new Error(structure_error + " : 17");
						}
					}

					// instructions
					if (typeof(source.products[i].instructions) !== "object") {
						throw new Error(structure_error + " : 18");
					}
					if (typeof(source.products[i].instructions.content) !== "string") {
						throw new Error(structure_error + " : 19");
					}
					if (typeof(source.products[i].instructions.maxlength) !== "boolean" && typeof(source.products[i].instructions.maxlength) !== "number") {
						throw new Error(structure_error + " : 20");
					}
				}
			}

			// ------------------------------------------
			// additions

			if (typeof(source.additions) !== "object") {
				throw new Error(structure_error + " : 21");
			}

			if (source.additions.length > 0) {
				for (var i in source.additions) {

					// id
					if (typeof(source.additions[i].id) !== "number") {
						throw new Error(structure_error + " : 22");
					}

					// name
					if (typeof(source.additions[i].name) !== "string") {
						throw new Error(structure_error + " : 23");
					}

					// min
					if (typeof(source.additions[i].min) !== "boolean" && typeof(source.additions[i].min) !== "number") {
						throw new Error(structure_error + " : 24");
					}

					// max
					if (typeof(source.additions[i].max) !== "boolean" && typeof(source.additions[i].max) !== "number") {
						throw new Error(structure_error + " : 25");
					}

					// type
					if (typeof(source.additions[i].type) !== "string" || (source.additions[i].type !== "single" && source.additions[i].type !== "multiple" && source.additions[i].type !== "text")) {
						throw new Error(structure_error + " : 26");
					}

					// ingredients and ingredient ids
					if (typeof(source.additions[i].ingredients) !== "object") {
						throw new Error(structure_error + " : 27");
					}
					if (source.additions[i].ingredients.length > 0) {
						for (var a in source.additions[i].ingredients) {
							if (typeof(source.additions[i].ingredients[a]) !== "number") {
								throw new Error(structure_error + " : 28");
							}
						}
					}
				}
			}

			// ------------------------------------------
			// ingredients

			if (typeof(source.ingredients) !== "object") {
				throw new Error(structure_error + " : 29");
			}

			if (source.ingredients.length > 0) {
				for (var a in source.ingredients) {

					// id
					if (typeof(source.ingredients[a].id) !== "number") {
						throw new Error(structure_error + " : 30");
					}

					// name
					if (typeof(source.ingredients[a].name) !== "string") {
						throw new Error(structure_error + " : 31");
					}

					// price
					if (typeof(source.ingredients[a].price) !== "number") {
						throw new Error(structure_error + " : 32");
					}
				}
			}
		}
		catch (e) {
			return e.message;
		}

		return true;
	}

	// my menu - set initia content
	function struct_mm_set_initial_content(content, category_counter, product_counter, addition_counter, ingredient_counter) {

		my_menu.content = content;

		my_menu.category_counter = category_counter;
		my_menu.product_counter = product_counter;
		my_menu.addition_counter = addition_counter;
		my_menu.ingredient_counter = ingredient_counter;
	}

	// update addition general info
	function struct_update_addition_data(source, addition_id, name, min, max, type, price_range, ingredients) {

		for (var i in source.additions) {

			if (source.additions[i].id == addition_id) {

				source.additions[i].name = name;
				source.additions[i].min = min;
				source.additions[i].max = max;
				source.additions[i].type = type;
				source.additions[i].pricerange = price_range;
				source.additions[i].ingredients = ingredients;
			}
		}
	}

	// update product general info
	function struct_update_product_data(source, product_id, name, price, description, min, max, instructions, instructions_ml) {

		for (var i in source.products) {

			if (source.products[i].id == product_id) {

				source.products[i].name = name;
				source.products[i].price = price;
				source.products[i].description = description;
				source.products[i].min = min;
				source.products[i].max = max;
				source.products[i].instructions = {
					"content" : instructions,
					"maxlength" : instructions_ml
				};
			}
		}
	}

	// update category general info
	function struct_update_category_data(source, category_id, name, description) {

		for (var i in source.categories) {

			if (source.categories[i].id == category_id) {
				source.categories[i].name = name;
				source.categories[i].description = description;
			}
		}
	}

	// is this ingredient in use
	function struct_is_ingredient_in_use(source, ingredient_id) {

		for (var i in source.content.additions) {

			for (var a in source.content.additions[i].ingredients) {

				if (source.content.additions[i].ingredients[a] == ingredient_id) {
					return true;
				}
			}
		}

		return false;
	}

	// remove ingredient
	function struct_remove_ingredient(source, ingredient_id, remove_from_additions) {

		for (var i in source.ingredients) {

			if (source.ingredients[i].id == ingredient_id) {
				arr_remove_element(source.ingredients, i);
				break;
			}
		}

		if (remove_from_additions) {
			for (var i in source.additions) {

				var adds = [];

				for (var a in source.additions[i].ingredients) {

					if (source.additions[i].ingredients[a] == ingredient_id) {
						continue;
					}

					adds.push(source.additions[i].ingredients[a]);
				}

				source.additions[i].ingredients = adds;
			}
		}
	}

	// add new ingredient structure
	function struct_add_ingredient(source, ingredient_name) {

		var ingredient_id = source.ingredient_counter++;

		// add the new ingredient structure
		source.content.ingredients.push({
			"id" : ingredient_id,
			"name" : ingredient_name,
			"price" : 0
		});

		return ingredient_id;
	}

	// update ingredient data
	function struct_update_ingredient_data(source, ingredient_id, name, price) {

		for (var i in source.ingredients) {
			if (source.ingredients[i].id == ingredient_id) {
				source.ingredients[i].name = name;
				source.ingredients[i].price = price;
				return;
			}
		}

		throw new Error("Ingredient id not found");
	}

	// set addition arange
	function struct_set_addition_arange(source, id) {

		var addition_ids = [];

		$("#current-menu .product-additions-wrapper [data-id].item").each( function() {

			addition_ids.push($(this).data("id"));
		});

		for (var i in source) {

			if (source[i].id == id) {

				source[i].additions = addition_ids;

				break;
			}
		}
	}

	// set product arange
	function struct_set_product_arange(source) {

		var product_ids = [];
		var current_temp = [], current = [];
		var others = [];
		var added;

		$("#current-menu .category-products-wrapper [data-id].item").each( function() {

			product_ids.push($(this).data("id"));
		});

		for (var i in source) {
			added = false;

			for (var a in product_ids) {
				if (source[i].id == product_ids[a]) {
					current_temp.push(source[i]);
					added = true;
				}
			}

			if ( ! added) {
				others.push(source[i]);
			}
		}

		for (var a in product_ids) {

			for (var i in current_temp) {
				if (current_temp[i].id == product_ids[a]) {
					current.push(current_temp[i]);
				}
			}
		}

		return current.concat(others);
	}

	// set category arange
	function struct_set_category_arange(source) {

		var category_ids = [];
		var temp = [];

		$("#current-menu .category-list-wrapper [data-id].item").each( function() {

			category_ids.push($(this).data("id"));
		});

		for (var a in category_ids) {

			for (var i in source) {
				if (source[i].id == category_ids[a]) {
					temp.push(source[i]);
				}
			}
		}

		return temp;
	}

	// add addition from a product
	function struct_add_product_addition(source, addition_id) {

		var found = false;

		for (var i in source) {

			if (source[i] == addition_id) {
				found = true;
				break;
			}
		}

		if ( ! found) {
			source.push(addition_id);
		}
	}

	// remove addition from a product
	function struct_remove_product_addition(source, addition_id) {
		for (var i in source) {

			if (source[i] == addition_id) {
				arr_remove_element(source, i);
				break;
			}
		}
	}

	// add/remove addition from a product
	function struct_toggle_product_addition(source, product_id, addition_id, selected) {

		for (var i in source) {

			if (source[i].id == product_id) {
				if (selected) {
					struct_add_product_addition(source[i].additions, addition_id);
				}
				else {
					struct_remove_product_addition(source[i].additions, addition_id);
				}

				break;
			}
		}
	}

	// remove addition
	function struct_remove_addition(source, product_id, addition_id) {

		for (var i in source) {

			if (source[i].id == product_id) {

				for (var a in source[i].additions) {

					if (source[i].additions[a] == addition_id) {
						arr_remove_element(source[i].additions, a);
					}
				}

				return;
			}
		}
	}

	// remove product
	function struct_remove_product(source, product_id) {

		for (var i in source) {

			if (source[i].id == product_id) {
				arr_remove_element(source, i);
				return;
			}
		}
	}

	// remove category products
	function struct_remove_category_products(source, category_id) {

		// var addition_ids_removed = [];

		for (var i in source) {

			if (source[i].category == category_id) {
				arr_remove_element(source, i);
				return;
			}
		}

		// return addition_ids_removed;
	}

	// remove old category
	function struct_remove_category(source, category_id) {

		for (var i in source) {

			if (source[i].id == category_id) {
				arr_remove_element(source, i);
				return;
			}
		}
	}

	// add new addition structure
	function struct_add_addition(source, addition_name, product_id, addition_id) {

		// add the new addition structure
		source.additions.push({
			"id" : addition_id,
			"name" : addition_name,
			"min" : 1,
			"max" : false,
			"type" : "multiple",
			"pricerange": false,
			"ingredients" : []
		});

		// add the new addition to the product's additions list
		for (var i in source.products) {
			if (source.products[i].id == product_id) {
				source.products[i].additions.push(addition_id);
				break;
			}
		}
	}

	// add new product structure
	function struct_add_product(source, product_name, category_id) {

		var product_id = source.product_counter++;

		// add the new product structure
		source.content.products.push({
			"category" : category_id,
			"id" : product_id,
			"name" : product_name,
			"price" : 0,
			"description" : "",
			"min" : false,
			"max" : false,
			"additions" : [],
			"instructions" : {"content" : "", "maxlength" : 200}
		});

		return product_id;
	}

	// add new category structure
	function struct_add_category(source, category_name) {

		var category_id = source.category_counter++;

		// add the new category structure
		source.content.categories.push({
			"id" : category_id,
			"name" : category_name,
			"description" : ""
		});

		return category_id;
	}

	// ======================================================================
	// EDIT SECTIONS
	// ======================================================================

	// addition edit - get all ingredients
	function addition_edit_get_all_ingredients() {

		var ingredients = [];
		var ingredient_id;

		$("#current-menu .addition-edit-ingredients input").each( function() {

			if (true == $(this).prop("checked")) {
				ingredient_id = parseInt($(this).val());
				ingredients.push(ingredient_id);
			}
		});

		return ingredients;
	}

	// rearange list item elements "down"
	function setup_list_items_rearange_down(container, id) {

		var current_id;
		var this_obj = null;
		var current_obj;

		var items = container.find("[data-id].item");
		var items_length = items.length;

		items.each( function(index) {

			current_id = $(this).data("id");

			if (current_id == id) {
				this_obj = $(this);

				if (index+1 == items_length) {
					$(this).remove();
					container.prepend(this_obj);
					return false;
				}
			}
			else if (this_obj !== null) {
				current_obj = $(this);
				$(this).remove();
				current_obj.insertBefore(this_obj);

				return false;
			}
		});
	}

	// rearange list item elements "up"
	function setup_list_items_rearange_up(container, id) {

		var current_id;
		var prev_obj;
		var this_obj;

		container.find("[data-id].item").each( function(index) {

			current_id = $(this).data("id");

			if (current_id == id) {

				this_obj = $(this);
				$(this).remove();

				if (index == 0) {
					container.append(this_obj);
				}
				else {
					this_obj.insertBefore(prev_obj);
				}

				return false;
			}
			else {
				prev_obj = $(this);
			}
		});
	}

	// setup existing additions edit section
	function setup_add_remove_existing_additions(source_additions, source_products, product_id) {

		var result_html = "";
		var current_additions;
		var hidden;
		var template = tmpl_get_content("list_item_existing_additions");

		// get all product selected additions
		for (var i in source_products) {

			if (source_products[i].id == product_id) {
				current_additions = source_products[i].additions;
				break;
			}
		}

		// render the additions
		for (var i in source_additions) {

			hidden = "hidden";

			for (var a in current_additions) {

				if (source_additions[i].id == current_additions[a]) {
					hidden = "";
					break;
				}
			}

			result_html += tmpl_render_existing_addition(template, source_additions[i], hidden);
		}

		$("#current-menu .additions-add-remove-existing .product-existing-additions-wrapper").html(result_html);
	}

	// setup addition edit section content
	function setup_addition_edit(source, addition_id) {

		// addition basic data
		var addition_data = data_get_addition(source.additions, addition_id);

		// focus and remove the addition name if its new and not modified
		if (addition_data.name == bucket.messsages.addition_edit.new_addition) {
			$("#current-menu .addition-edit-name").val("");
			$("#current-menu .addition-edit-name").focus();
		}
		else {
			$("#current-menu .addition-edit-name").val(addition_data.name);
		}

		$("#current-menu .addition-edit-min").val(addition_data.min == false ? "" : addition_data.min);
		$("#current-menu .addition-edit-max").val(addition_data.max == false ? "" : addition_data.max);
		$("#current-menu .addition-edit input[type=radio][name=addition-type]").each( function() {

			if ($(this).val() == addition_data.type) {
				$(this).prop("checked", true);
			}
			else {
				$(this).prop("checked", false);
			}
		});

		if (typeof(addition_data.pricerange) !== "boolean") {
			addition_data.pricerange = false;
		}
		$("#current-menu .addition-edit input[type=checkbox][name=addition-price-range]").prop("checked", addition_data.pricerange);

		// ingredients
		update_addition_ingredients(source, addition_data);
	}

	// setup product edit section content
	function setup_product_edit(source, product_id) {

		// product basic data
		var product_data = data_get_product(source.products, product_id);

		// focus and remove the product name if its new and not modified
		if (product_data.name == bucket.messsages.product_edit.new_product) {
			$("#current-menu .product-edit-name").val("");
			$("#current-menu .product-edit-name").focus();
		}
		else {
			$("#current-menu .product-edit-name").val(product_data.name);
		}

		$("#current-menu .product-edit-price").val(parseFloat(product_data.price).toFixed(2));
		$("#current-menu .product-edit-description").val(product_data.description);
		$("#current-menu .product-edit-min").val(product_data.min == false ? "" : product_data.min);
		$("#current-menu .product-edit-max").val(product_data.max == false ? "" : product_data.max);
		$("#current-menu .product-edit-instructions").val(product_data.instructions.content);
		$("#current-menu .product-edit-instructions-ml").val(product_data.instructions.maxlength == false ? "" : product_data.instructions.maxlength);

		// product additions
		var product_additions_source = data_get_product_additions(source.additions, product_data.additions);
		var product_additions = tmpl_compile_list_item(tmpl_get_content("list_item"), product_additions_source);
		$("#current-menu .product-additions-wrapper").html(product_additions);
	}

	// setup category edit section content
	function setup_category_edit(source, category_id) {

		// category basic data
		var category_data = data_get_category(source.categories, category_id);

		// focus and remove the category name if its new and not modified
		if (category_data.name == bucket.messsages.category_edit.new_category) {
			$("#current-menu .category-edit-name").val("");
			$("#current-menu .category-edit-name").focus();
		}
		else {
			$("#current-menu .category-edit-name").val(category_data.name);
		}

		$("#current-menu .category-edit-description").val(category_data.description);

		// category products
		var category_products_source = data_get_category_products(source.products, category_id);
		var category_products = tmpl_compile_list_item(tmpl_get_content("list_item"), category_products_source);
		$("#current-menu .category-products-wrapper").html(category_products);
	}

	// setup add new category structure
	function setup_add_new_category() {

		var category_name = bucket.messsages.category_edit.new_category;
		var category_id = struct_add_category(current_menu, category_name);
		var category_html = tmpl_render_list_item(tmpl_get_content("list_item"), {"id": category_id, "name": category_name});
		$("#current-menu .category-list-wrapper").append(category_html);

		return category_id;
	}

	// setup add new product structure
	function setup_add_new_product() {

		var product_name = bucket.messsages.product_edit.new_product;
		var product_id = struct_add_product(current_menu, product_name, current_menu.category_id);
		var product_html = tmpl_render_list_item(tmpl_get_content("list_item"), {"id": product_id, "name": product_name});
		$("#current-menu .category-products-wrapper").append(product_html);

		return product_id;
	}

	// setup add new addition structure
	function setup_add_new_addition() {

		var addition_name = bucket.messsages.addition_edit.new_addition;
		var addition_id = current_menu.addition_counter++;
		struct_add_addition(current_menu.content, addition_name, current_menu.product_id, addition_id);
		var addition_html = tmpl_render_list_item(tmpl_get_content("list_item"), {"id": addition_id, "name": addition_name});
		$("#current-menu .product-additions-wrapper").append(addition_html);

		return addition_id;
	}

	// ======================================================================
	// CURRENT MENU
	// ======================================================================

	// update addition ingredients items
	function update_addition_ingredients(source, addition_data) {

		var ingredients_data_source = get_ingredients_data(source.ingredients, addition_data.ingredients);
		var ingredients_data = tmpl_compile_ingredient_items(source.ingredients, ingredients_data_source);
		$("#current-menu .addition-edit-ingredients").html(ingredients_data);
	}

	// setup current menu
	function setup_current_menu() {

		// render
		var category_list_items = tmpl_compile_list_item(tmpl_get_content("list_item"), current_menu.content.categories);

		// put into the DOM
		$("#current-menu .category-list-wrapper").html(category_list_items);
	}

	// show category edit section
	function show_category_edit() {

		$("#current-menu .category-edit").removeClass("hidden");
	}

	// hide category edit section
	function hide_category_edit() {

		$("#current-menu .category-edit").addClass("hidden");
	}

	// show category list section
	function show_category_list() {

		$("#current-menu .category-list").removeClass("hidden");
	}

	// hide category list section
	function hide_category_list() {

		$("#current-menu .category-list").addClass("hidden");
	}

	// show product edit
	function show_product_edit() {

		$("#current-menu .product-edit").removeClass("hidden");
	}

	// hide product edit
	function hide_product_edit() {

		$("#current-menu .product-edit").addClass("hidden");
	}

	// show addition edit
	function show_addition_edit() {

		$("#current-menu .addition-edit").removeClass("hidden");
	}

	// hide addition edit
	function hide_addition_edit() {

		$("#current-menu .addition-edit").addClass("hidden");
	}

	// show existing additions
	function show_existing_additions() {

		$("#current-menu .additions-add-remove-existing").removeClass("hidden");
	}

	// hide existing additions
	function hide_existing_additions() {

		$("#current-menu .additions-add-remove-existing").addClass("hidden");
	}

	// category edit show status success
	function category_edit_show_success(messasge) {

		var obj = $("#current-menu .category-edit .status-message");

		clearTimeout(current_menu.category_edit_tid);

		obj.removeClass("error");
		obj.addClass("success");
		obj.html(messasge);

		current_menu.category_edit_tid = setTimeout( function() {
			obj.html("");
		}, current_menu.timeout);
	}

	// category edit show status error
	function category_edit_show_error(messasge) {

		var obj = $("#current-menu .category-edit .status-message")

		clearTimeout(current_menu.category_edit_tid);

		obj.addClass("error");
		obj.removeClass("success");
		obj.html(messasge);

		current_menu.category_edit_tid = setTimeout( function() {
			obj.html("");
		}, current_menu.timeout);
	}

	// category edit show status error
	function category_edit_hide_status() {

		clearTimeout(current_menu.category_edit_tid);

		$("#current-menu .category-edit .status-message").html("");
	}

	// product edit show status success
	function product_edit_show_success(messasge) {

		var obj = $("#current-menu .product-edit .status-message");

		clearTimeout(current_menu.product_edit_tid);

		obj.removeClass("error");
		obj.addClass("success");
		obj.html(messasge);

		current_menu.product_edit_tid = setTimeout( function() {
			obj.html("");
		}, current_menu.timeout);
	}

	// product edit show status error
	function product_edit_show_error(messasge) {

		var obj = $("#current-menu .product-edit .status-message")

		clearTimeout(current_menu.product_edit_tid);

		obj.addClass("error");
		obj.removeClass("success");
		obj.html(messasge);

		current_menu.product_edit_tid = setTimeout( function() {
			obj.html("");
		}, current_menu.timeout);
	}

	// product edit show status error
	function product_edit_hide_status() {

		clearTimeout(current_menu.product_edit_tid);

		$("#current-menu .product-edit .status-message").html("");
	}

	// addition edit show status success
	function addition_edit_show_success(messasge) {

		var obj = $("#current-menu .addition-edit .status-message");

		clearTimeout(current_menu.addition_edit_tid);

		obj.removeClass("error");
		obj.addClass("success");
		obj.html(messasge);

		current_menu.addition_edit_tid = setTimeout( function() {
			obj.html("");
		}, current_menu.timeout);
	}

	// addition edit show status error
	function addition_edit_show_error(messasge) {

		var obj = $("#current-menu .addition-edit .status-message")

		clearTimeout(current_menu.addition_edit_tid);

		obj.addClass("error");
		obj.removeClass("success");
		obj.html(messasge);

		current_menu.addition_edit_tid = setTimeout( function() {
			obj.html("");
		}, current_menu.timeout);
	}

	// addition edit show status error
	function addition_edit_hide_status() {

		clearTimeout(current_menu.addition_edit_tid);

		$("#current-menu .addition-edit .status-message").html("");
	}

	// (global) Action Button
	$(document).on({
		click: function(ev) {
			ev.stopPropagation();
		}
	}, ".category-list .item .action, .category-edit .item .action, #product-list .item .action");

	// (category-list) "Up" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_up($("#current-menu .category-list-wrapper"), id);

			current_menu.content.categories = struct_set_category_arange(current_menu.content.categories);

			// update current menu source
			update_current_menu_source();
		}
	}, "#current-menu .category-list-wrapper .action.up");

	// (category-list) "Down" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_down($("#current-menu .category-list-wrapper"), id);

			current_menu.content.categories = struct_set_category_arange(current_menu.content.categories);

			// update current menu source
			update_current_menu_source();
		}
	}, "#current-menu .category-list-wrapper .action.down");

	// (category-list) New Category Button
	$("#current-menu .category-list-new-category").on({
		click: function() {

			var category_id = setup_add_new_category();

			$("#current-menu .category-list [data-id=" +category_id+ "].item .action.edit").click();
		}
	});

	// (category-list) List Item
	$(document).on({
		click: function() {
			console.info("# ITEM CLICKED");
		}
	}, "#current-menu .category-list .item");

	// (category-list) Action Delete
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-id]");
			var category_id = obj.data("id");

			popup_init({
				yes : function() {
					obj.remove();
					struct_remove_category(current_menu.content.categories, category_id);
					struct_remove_category_products(current_menu.content.products, category_id);

					// update current menu source
					update_current_menu_source();
				}
			});
		}
	}, "#current-menu .category-list .item .action.delete");

	// (category-list) Action Edit
	$(document).on({
		click: function() {

			show_category_edit();
			hide_category_list();

			current_menu.category_id = $(this).closest("[data-id]").data("id");
			setup_category_edit(current_menu.content, current_menu.category_id);
		}
	}, "#current-menu .category-list .item .action.edit");

	// (category-edit) Save Button
	$("#current-menu .category-edit .action-button.update").on({
		click: function() {

			var name = $("#current-menu .category-edit-name").val().trim();
			var description = $("#current-menu .category-edit-description").val().trim();

			if (name == "") {
				category_edit_show_error(bucket.messsages.category_edit.empty_name);
				return;
			}

			// show success and hide error
			category_edit_show_success(bucket.messsages.category_edit.saved_ok);

			// store the values
			struct_update_category_data(current_menu.content, current_menu.category_id, name, description);

			// update the list item name
			$("#current-menu .category-list-wrapper [data-id=" + current_menu.category_id + "] .title").html(name);

			// update current menu source
			update_current_menu_source();
		}
	});

	// (category-edit) "Up" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_up($("#current-menu .category-products-wrapper"), id);

			current_menu.content.products = struct_set_product_arange(current_menu.content.products);

			// update current menu source
			update_current_menu_source();
		}
	}, "#current-menu .category-products-wrapper .action.up");

	// (category-edit) "Down" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_down($("#current-menu .category-products-wrapper"), id);

			current_menu.content.products = struct_set_product_arange(current_menu.content.products);

			// update current menu source
			update_current_menu_source();
		}
	}, "#current-menu .category-products-wrapper .action.down");

	// (category-edit) New Product Button
	$("#current-menu .category-edit-new-product").on({
		click: function() {

			var product_id = setup_add_new_product();

			$("#current-menu .category-edit [data-id=" +product_id+ "].item .action.edit").click();
		}
	});

	// (category-edit) Back Button
	$("#current-menu .category-edit .action-button.back").on({
		click: function() {
			hide_category_edit();
			show_category_list();
		}
	});

	// (category-edit) Action Delete
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-id]");
			var product_id = obj.data("id");

			popup_init({
				yes : function() {
					obj.remove();
					struct_remove_product(current_menu.content.products, product_id);

					// update current menu source
					update_current_menu_source();
				}
			});
		}
	}, "#current-menu .category-edit .item .action.delete");

	// (category-edit) Product Edit
	$(document).on({
		click: function() {

			hide_category_edit();
			show_product_edit();

			current_menu.product_id = $(this).closest("[data-id]").data("id");
			setup_product_edit(current_menu.content, current_menu.product_id);
		}
	}, "#current-menu .category-edit .action.edit");

	// (product-edit) Save Button
	$("#current-menu .product-edit .action-button.update").on({
		click: function() {

			var name = $("#current-menu .product-edit-name").val().trim();
			var price = $("#current-menu .product-edit-price").val().trim();
			var description = $("#current-menu .product-edit-description").val().trim();
			var min_quantity = $("#current-menu .product-edit-min").val().trim();
			var max_quantity = $("#current-menu .product-edit-max").val().trim();
			var instructions = $("#current-menu .product-edit-instructions").val().trim();
			var instructions_ml = $("#current-menu .product-edit-instructions-ml").val().trim();

			if (name == "") {
				product_edit_show_error(bucket.messsages.product_edit.empty_name);
				return;
			}

			if (price == "") {
				product_edit_show_error(bucket.messsages.product_edit.empty_price);
				return;
			}
			price = parseFloat(price);

			if (min_quantity != "") {
				if (false == is_integer_valid(min_quantity)) {
					product_edit_show_error(bucket.messsages.invalid_min_quantity);
					return;
				}
				min_quantity = parseInt(min_quantity);
				if (min_quantity == 0) {
					min_quantity = false;
				}
			}
			else {
				min_quantity = false;
			}

			if (max_quantity != "") {
				if (false == is_integer_valid(max_quantity)) {
					product_edit_show_error(bucket.messsages.invalid_max_quantity);
					return;
				}
				max_quantity = parseInt(max_quantity);
				if (max_quantity == 0) {
					max_quantity = false;
				}
			}
			else {
				max_quantity = false;
			}

			if (min_quantity != false && max_quantity !== false) {
				if (min_quantity > max_quantity) {
					product_edit_show_error(bucket.messsages.invalid_min_higher_than_max);
					return;
				}
			}

			if (instructions_ml != "") {
				if (false == is_integer_valid(instructions_ml)) {
					product_edit_show_error(bucket.messsages.product_edit.invalid_instructions_ml);
					return;
				}
				instructions_ml = parseInt(instructions_ml);
				if (instructions_ml == 0) {
					instructions_ml = false;
				}
			}
			else {
				instructions_ml = false;
			}

			// show success and hide error
			product_edit_show_success(bucket.messsages.product_edit.saved_ok);

			// store the values
			struct_update_product_data(current_menu.content, current_menu.product_id, name, price, description, min_quantity, max_quantity, instructions, instructions_ml);

			// update the list item name
			$("#current-menu .category-products-wrapper [data-id=" + current_menu.product_id + "] .title").html(name);

			// update current menu source
			update_current_menu_source();
		}
	});

	// (product-edit) "Down" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_down($("#current-menu .product-additions-wrapper"), id);

			struct_set_addition_arange(current_menu.content.products, current_menu.product_id);

			// update current menu source
			update_current_menu_source();
		}
	}, "#current-menu .product-additions-wrapper .action.down");

	// (product-edit) "Up" Button
	$(document).on({
		click: function() {

			var id = $(this).closest("[data-id]").data("id");

			setup_list_items_rearange_up($("#current-menu .product-additions-wrapper"), id);

			struct_set_addition_arange(current_menu.content.products, current_menu.product_id);

			// update current menu source
			update_current_menu_source();
		}
	}, "#current-menu .product-additions-wrapper .action.up");

	// (product-edit) New Addition Button
	$("#current-menu .product-edit-new-addition").on({
		click: function() {

			var addition_id = setup_add_new_addition();

			$("#current-menu .product-edit [data-id=" +addition_id+ "].item .action.edit").click();
		}
	});

	// (product-edit) Back Button
	$("#current-menu .product-edit .action-button.back").on({
		click: function() {

			show_category_edit();
			hide_product_edit();
		}
	});

	// (product-edit) Action Edit
	$(document).on({
		click: function() {

			hide_product_edit();
			show_addition_edit();

			current_menu.addition_id = $(this).closest("[data-id]").data("id");
			setup_addition_edit(current_menu.content, current_menu.addition_id);

			// update current menu - addition ingredients data
			if (current_menu.addition_id !== null) {
				update_addition_ingredients(current_menu.content, data_get_addition(current_menu.content.additions, current_menu.addition_id));
			}
		}
	}, "#current-menu .product-edit .action.edit");

	// (product-edit) Action Delete
	$(document).on({
		click: function() {

			var obj = $(this).closest("[data-id]");
			var addition_id = obj.data("id");

			popup_init({
				yes : function() {
					obj.remove();
					struct_remove_addition(current_menu.content.products, current_menu.product_id, addition_id);

					// update current menu source
					update_current_menu_source();
				}
			});
		}
	}, "#current-menu .product-edit .item .action.delete");

	// (product-edit) Add/Remove Existing Additions Button
	$("#current-menu .product-edit-add-remove-existing-additions").on({
		click: function() {

			setup_add_remove_existing_additions(current_menu.content.additions, current_menu.content.products, current_menu.product_id);

			show_existing_additions();
			hide_product_edit();
		}
	});

	// (add/remove existing additions) Back Button
	$("#current-menu .additions-add-remove-existing .action-button.back").on({
		click: function() {

			var product_data = data_get_product(current_menu.content.products, current_menu.product_id);
			var product_additions_source = data_get_product_additions(current_menu.content.additions, product_data.additions);
			var product_additions = tmpl_compile_list_item(tmpl_get_content("list_item"), product_additions_source);
			$("#current-menu .product-additions-wrapper").html(product_additions);

			hide_existing_additions();
			show_product_edit();
		}
	});

	// (add/remove existing additions) Add/Remove Button
	$(document).on({
		click: function() {

			var addition_id = $(this).data("id");
			var selected = $(this).find(".added");
			// currently not selected
			// make it selected
			if (selected.hasClass("hidden")) {
				selected.removeClass("hidden");
				selected = true;
			}
			// currently selected
			// make it not selected
			else {
				selected.addClass("hidden");
				selected = false;
			}
			struct_toggle_product_addition(current_menu.content.products, current_menu.product_id, addition_id, selected);

			// update current menu source
			update_current_menu_source();
		}
	}, "#current-menu .additions-add-remove-existing .product-existing-additions-wrapper [data-id].item");

	// (addition-edit) Back Button
	$("#current-menu .addition-edit .action-button.back").on({
		click: function() {

			hide_addition_edit();
			show_product_edit();
		}
	});

	// (addition-edit) Save Button
	$("#current-menu .addition-edit .action-button.update").on({
		click: function() {

			var name = $("#current-menu .addition-edit-name").val().trim();
			var min_quantity = $("#current-menu .addition-edit-min").val().trim();
			var max_quantity = $("#current-menu .addition-edit-max").val().trim();
			var type = $("#current-menu .addition-edit [name=addition-type]:checked").val();
			var price_range = $("#current-menu .addition-edit [name=addition-price-range]").prop("checked");
			var ingredients = addition_edit_get_all_ingredients();

			if (name == "") {
				addition_edit_show_error(bucket.messsages.addition_edit.empty_name);
				return;
			}

			if (min_quantity != "") {
				if (false == is_integer_valid(min_quantity)) {
					addition_edit_show_error(bucket.messsages.invalid_min_quantity);
					return;
				}
				min_quantity = parseInt(min_quantity);
				if (min_quantity == 0) {
					min_quantity = false;
				}
			}
			else {
				min_quantity = false;
			}

			if (max_quantity != "") {
				if (false == is_integer_valid(max_quantity)) {
					addition_edit_show_error(bucket.messsages.invalid_max_quantity);
					return;
				}
				max_quantity = parseInt(max_quantity);
				if (max_quantity == 0) {
					max_quantity = false;
				}
			}
			else {
				max_quantity = false;
			}

			if (min_quantity != false && max_quantity !== false) {
				if (min_quantity > max_quantity) {
					addition_edit_show_error(bucket.messsages.invalid_min_higher_than_max);
					return;
				}
			}

			if (ingredients.length == 0) {
				addition_edit_show_error(bucket.messsages.addition_edit.empty_ingredients);
				return;
			}

			// show success and hide error
			addition_edit_show_success(bucket.messsages.addition_edit.saved_ok);

			// store the values
			struct_update_addition_data(current_menu.content, current_menu.addition_id, name, min_quantity, max_quantity, type, price_range, ingredients);

			// update the list item name
			$("#current-menu .product-additions-wrapper [data-id=" + current_menu.addition_id + "] .title").html(name);

			// update current menu source
			update_current_menu_source();
		}
	});

	// ======================================================================
	// MAIN MENU
	// ======================================================================

	// disable my-ingredients main menu button
	function disable_my_ingredients_mm_button() {

		$("#main-menu .my-ingredients").addClass("disabled");
	}

	// enable my-ingredients main menu button
	function enable_my_ingredients_mm_button() {

		$("#main-menu .my-ingredients").removeClass("disabled");
	}

	// enable/disable download button
	function check_download_state() {

		if (my_menu.content == null) {
			$("#main-menu .item.button.download").addClass("disabled");
		}
		else {
			$("#main-menu .item.button.download").removeClass("disabled");
		}

		/*
		if (true === struct_validate_full(my_menu.content)) {
			$("#main-menu .item.button.download").removeClass("disabled");
		}
		else {
			$("#main-menu .item.button.download").addClass("disabled");
		}
		*/
	}

	// show download message
	function download_show_message(message) {

		clearTimeout(download.tid);

		var obj = $("#download .download-message");

		obj.html(message);

		download.tid = setTimeout( function() {
			obj.html("");
		}, 5000);
	}

	// hide download message
	function download_hide_message() {

		clearTimeout(download.tid);

		$("#download .download-message").html("");
	}

	// buttons
	$(document).on({
		click: function() {

			bucket.active_section = $(this).data("name");

			// active/inactive
			$(this).siblings().removeClass("active");
			$(this).addClass("active");

			// hide all content
			$("main > [id]").addClass("hidden");

			// show the selected content
			$("#" + bucket.active_section).removeClass("hidden");

			// if the current section is "download"
			// check for my menu structure errors
			if (bucket.active_section == "download") {
				var pure_data = struct_clean_up(my_menu.content);

				if (pure_data[4].length > 0 || pure_data[5].length > 0) {

					var errors = "";

					// categories
					if (pure_data[4].length > 0) {
						errors += tmpl_get_content("download_structure_error_categories_title");
						errors += setup_download_strucure_errors_categories(pure_data[4]);
					}

					// product price
					if (pure_data[5].length > 0) {

						// add an empty line
						if (errors != "") {
							errors += "<br>";
						}

						errors += tmpl_get_content("download_structure_error_products_price_title");
						errors += setup_download_strucure_errors_products_price(pure_data[5]);
					}

					// show the errors
					$("#download .download-notice").removeClass("hidden");
					$("#download .download-notice .warn-wrapper").html(errors);
				}
				else {
					$("#download .download-notice").addClass("hidden");
					$("#download .download-notice .warn-wrapper").html("");
				}
			}
		}
	}, "header .item.button:not(.disabled)");

	function download_mymenu_file(clean_up) {

		var tax = $("#download input.tax").val().trim();
		if (tax.length == 0) {
			download_show_message("TAX is required");
			return;
		}
		if ( ! is_number_valid(tax)) {
			download_show_message("Invalid TAX value");
			return;
		}
		download_hide_message();
		tax = parseFloat(tax);

		var file_name = $("#download input.download-file-name").val().trim();
		if (file_name.length == 0) {
			download_show_message("File name is required");
			return;
		}
		download_hide_message();

		// var source = my_menu.content;
		var source = jQuery.extend(true, {}, my_menu.content);

		// add settings
		source.settings = {};

		// add tax
		source.settings.tax = tax;

		if (clean_up) {
			/*
			var valid_structure = struct_validate_full(source.content);

			if (true !== valid_structure) {
				download_show_message("My Menu does not contain a valid menu structure!");
				return;
			}
			*/
			var pure_data = struct_clean_up(source);

			source.categories = pure_data[0];
			source.products = pure_data[1];
			source.additions = pure_data[2];
			source.ingredients = pure_data[3];
		}

		var content = JSON.stringify(source);

		var blob = new Blob([content], {type: "application/json;charset=utf-8"});
		saveAs(blob, file_name + ".json");
	}

	// download file without clean up
	$(document).on({
		click: function() {

			download_mymenu_file(false);
		}
	}, "#download .action-button.download:not(.disabled)");

	// download file with clean up
	$(document).on({
		click: function() {

			download_mymenu_file(true);
		}
	}, "#download .action-button.cleanup-download:not(.disabled)");

	// ======================================================================
	// DATA
	// ======================================================================

	// get ingredient data
	function data_get_ingredient(source, ingredient_id) {

		for (var i in source) {
			if (source[i].id == ingredient_id) {
				return source[i];
			}
		}

		console.error("Ingredient id not found");
	}

	// get ingredients data
	function get_ingredients_data(source, ingredient_ids) {

		var result = [];

		for (var i in ingredient_ids) {
			for (var a in source) {
				if (source[a].id == ingredient_ids[i]) {
					result.push(source[a]);
				}
			}
		}

		return result;
	}

	// get addition data
	function data_get_addition(source, addition_id) {

		for (var i in source) {
			if (source[i].id == addition_id) {
				return source[i];
			}
		}

		console.error("Addition id not found");
	}

	// get product additions
	function data_get_product_additions(source, addition_ids) {

		var result = [];

		for (var i in addition_ids) {
			for (var a in source) {
				if (source[a].id == addition_ids[i]) {
					result.push(source[a]);
				}
			}
		}

		return result;
	}

	// get product data
	function data_get_product(source, product_id) {

		for (var i in source) {

			if (source[i].id == product_id) {
				return source[i];
			}
		}

		console.error("Product id not found");
	}

	// get category products
	function data_get_category_products(source, category_id) {

		var products = [];

		for (var i in source) {

			if (source[i].category == category_id) {
				products.push(source[i]);
			}
		}

		return products;
	}

	// get category data
	function data_get_category(source, category_id) {

		for (var i in source) {

			if (source[i].id == category_id) {
				return source[i];
			}
		}

		console.error("Category id not found");
	}

	// data loader
	function data_loader() {

		var current_menu_source = $.ajax({
			"url": bucket.data.url,
			"dataType": "text"
		});
		current_menu_source.fail( function() { alert("Error in loading the current menu source"); });
		current_menu_source.done( function(data) {
			// console.log(data);

			try {
				// parse
				var content = JSON.parse(data.trim());

				// init current menu counters

				// Source
				bucket.data.content = content;

				// Current Menu
				current_menu.content = content;

				// category counter
				current_menu.category_counter = calc_category_counter(current_menu.content);

				// product counter
				current_menu.product_counter = calc_product_counter(current_menu.content);

				// addition counter
				current_menu.addition_counter = calc_addition_counter(current_menu.content);

				// ingredient counter
				current_menu.ingredient_counter = calc_ingredient_counter(current_menu.content);

				// ready
				bucket.data.ready = true;
			}
			catch (e) {

				$("#loading-message").removeClass("hidden");
				$("#loading-message").html("Error...");
				$("main").css("color", "rgb(240, 40, 40)");
				$("main").html("Invalid or missing menu file");
			}
		});
	}

	// data init
	function data_init() {

		var tid;
		var counter = 0;

		tid = setInterval( function() {

			if (bucket.data.ready && tmpl_loaded_validator()) {

				setup_current_menu();
				setup_edit_ingredients();

				init_sections();

				clearInterval(tid);

				return;
			}

			counter++;

			// if the content is not yet loaded,
			// this will make the loading message visible after certain amount of time
			if (counter >= 20) {
				$("#loading-message").removeClass("hidden");
			}
		}, 50);
	}

	// ======================================================================
	// TEMPLATES
	// ======================================================================

	// compile all the download structure erors - product's price
	function tmpl_compile_download_structure_errors_products_price(source) {

		var result = "";
		var tmpl = tmpl_get_content("download_structure_error_products_price");
		var structure;

		for (var i in source) {

			structure = tmpl;
			structure = structure.replace("{{product_name}}", source[i].product_name);
			structure = structure.replace("{{category_name}}", source[i].category_name);

			result += structure;
		}

		return result;
	}

	// compile all the download structure erors - categories
	function tmpl_compile_download_structure_errors_categories(source) {

		var result = "";
		var tmpl = tmpl_get_content("download_structure_error_categories");

		for (var i in source) {
			result += tmpl.replace("{{category_name}}", source[i])
		}

		return result;
	}

	// render existing addition
	function tmpl_render_existing_addition(template, source, hidden) {

		template = template.replace("{{id}}", source.id);
		template = template.replace("{{name}}", source.name);
		template = template.replace("{{hidden}}", hidden);

		return template;
	}

	// compile ingredient items
	function tmpl_compile_ingredient_items(source, ingredient_ids) {

		var result = "";
		var tmpl = tmpl_get_content("ingredient_item");
		var checked;

		for (var i in source) {

			for (var a in ingredient_ids) {
				if (source[i].id == ingredient_ids[a].id) {
					checked = "checked";
					break;
				}
				else {
					checked = "";
				}
			}

			result += tmpl_render_ingredient_item(tmpl, source[i], checked);
		}

		return result;
	}

	// render ingredient item
	function tmpl_render_ingredient_item(tmpl, source, checked) {

		tmpl = tmpl.replace(/\{\{id\}\}/g, source.id);
		tmpl = tmpl.replace(/\{\{name\}\}/g, source.name);
		tmpl = tmpl.replace(/\{\{checked\}\}/g, checked);

		return tmpl;
	}

	// compile list item
	function tmpl_compile_list_item(tmpl, source) {

		var result = "";

		for (var i in source) {
			result += tmpl_render_list_item(tmpl, source[i]);
		}

		return result;
	}

	// render list item
	function tmpl_render_list_item(tmpl, source) {

		tmpl = tmpl.replace(/\{\{id\}\}/g, source.id);
		tmpl = tmpl.replace(/\{\{name\}\}/g, source.name);

		return tmpl;
	}

	// templates loader
	function tmpl_loader() {

		for (var id in templates.list) {
			tmpl_file_loader(id, templates.url + templates.list[id].file);
		}
	}

	// template file loader
	function tmpl_file_loader(id, url) {

		$.get( url, function(data) {
			tmpl_store_content(id, data);
		}, "text");
	}

	// store template content
	function tmpl_store_content(id, content) {

		templates.list[id].content = content;
	}

	// get template content
	function tmpl_get_content(name) {

		if (typeof(templates.list[name]) !== "undefined") {
			return templates.list[name].content;
		}

		console.error("Missing template: " + name);
		return "Missing template";
	}

	// tempaltes loaded validator
	function tmpl_loaded_validator() {

		var status = true;

		for (var i in templates.list) {

			if (templates.list[i].content === null) {
				status = false;
				break;
			}
		}

		return status;
	}

	// ======================================================================
	// POPUP
	// ======================================================================

	function popup_get_warn_message() {

		var tmpl = tmpl_get_content("ingredient_in_use");

		tmpl = tmpl.replace("{{message}}", bucket.messsages.popup.ingredient_in_use);

		return tmpl + bucket.messsages.popup.confirm;
	}

	var Popup = function(properties) {

		var popup_window = $("#popup");
		var popup_yes = $("#popup-yes");
		var popup_no = $("#popup-no");
		var popup_close = $("#popup-close");
		var popup_close_icon = $("#popup-close-icon");
		var popup_message = $("#popup-message");
		var popup_title = $("#popup-title");

		// defaults
		if (typeof(properties) !== "object") {
			properties = {};
		}

		if (typeof(properties.title) !== "string") {
			properties.title = "Delete confirmation";
		}

		if (typeof(properties.message) !== "string") {
			properties.message = bucket.messsages.popup.confirm;
		}

		// Close
		var close = function() {
			popup_window.addClass("hidden");

			$("body").css("overflow", "auto");
		};

		// Open
		var open = function() {
			popup_window.removeClass("hidden");

			var scroll_top = $("body").prop("scrollTop");

			$("#popup .wrapper").css("margin-top", scroll_top + 100);

			$("body").css("overflow-x", "hidden");
			$("body").css("overflow-y", "hidden");
		};

		// Yes
		var handler_yes = (function() {

			if (typeof(properties.yes) !== "function") {
				properties.yes = function() {};
			}

			return function() {
				properties.yes();
				close();
			};
		})();

		// No
		var handler_no = (function() {

			if (typeof(properties.no) !== "function") {
				properties.no = function() {};
			}

			return function() {
				properties.no();
				close();
			};
		})();

		// Add Event Handler for "Yes"
		if (typeof(properties.yes_name) !== "undefined") {
			popup_yes.html(properties.yes_name);
		}
		if (typeof(properties.yes_default_color) !== "undefined") {
			popup_yes.removeClass("yes");
		}
		popup_yes.off("click");
		popup_yes.on({
			click : handler_yes
		});

		// Add Event Handler for "No"
		if (typeof(properties.no_name) !== "undefined") {
			popup_no.html(properties.no_name);
		}
		popup_no.off("click");
		popup_no.on({
			click : handler_no
		});

		// Add Event Handler for "X"
		popup_close.off("click");
		popup_close.off("mouseover");
		popup_close.off("mouseout");
		popup_close.on({
			click : close,
			mouseover : function() {
				popup_close_icon.attr("fill", "#28F028");
			},
			mouseout : function() {
				popup_close_icon.attr("fill", "#F0F0F0");
			}
		});

		// init content
		popup_title.html(properties.title);
		popup_message.html(properties.message);

		// return
		return {
			open: open,
			close: close
		};
	};

	function popup_init(properties) {

		(new Popup(properties)).open();
	}

	/*
	popup_init({
		yes : function() {

			console.info("Yes");
		},
		no : function() {

			console.info("No");
		},
		title : "Window title",
		message : "Message"
	});
	*/

	// ======================================================================
	// GENERAL
	// ======================================================================

	Array.max = function(array) {
		return Math.max.apply(Math, array);
	};

	function arr_remove_element(obj, pos) {

		obj.splice(pos, 1);
	}

	function is_number_valid(value) {

		var matches = /(^\.\d+$)|(^(?!0)\d+\.\d+$)|(^0\.\d+$)|(^0\.?$)|(^(?!0)\d+\.?$)/.exec(value);

		if ( matches == null ) {
			return false;
		}

		return true;
	}

	function is_integer_valid(value) {

		var matches = /^\d+$/.exec(value);

		if ( matches == null ) {
			return false;
		}

		return true;
	}

	function utf8_to_b64(str) {
		return window.btoa(escape(encodeURIComponent(str)));
	}

	function b64_to_utf8(str) {
		return decodeURIComponent(unescape(window.atob(str)));
	}

	// mouse events for svg icons for Up and Down actions on each list item
	$(document).on({
		mouseover : function() {
			$(this).find(".shape").attr("fill", "#28F028");
		},
		mouseout : function() {
			$(this).find(".shape").attr("fill", "#F0F0F0");
		}
	}, ".action .action-svg");

	// update current menu source
	function update_current_menu_source() {

		/*
		if (true !== struct_validate_full(current_menu.content)) {
			console.info("Base Menu is incomplete! Save skipped.");
			return;
		}

		var pure_data = struct_clean_up(current_menu.content);

		current_menu.content.categories = pure_data[0];
		current_menu.content.products = pure_data[1];
		// current_menu.content.additions = pure_data[2];
		// current_menu.content.ingredients = pure_data[3];
		*/

		// $.post('update-current-menu.php', {'current-menu-source' : JSON.stringify(current_menu.content)}, function(res) {});
		$.post('/cater4party/menueditor/updateBaseMenuSource', {'baseMenuSource' : JSON.stringify(current_menu.content)}, function(res) { console.log(res); });
	}

	// ======================================================================
	// INIT
	// ======================================================================

	function init_sections() {

		bucket.active_section = $("header").data("default");

		$("#loading-message").addClass("hidden");
		$("#main-menu").removeClass("hidden");

		$("header [data-name=" +bucket.active_section+ "]").click();
	}

	data_loader();
	tmpl_loader();
	data_init();
});
