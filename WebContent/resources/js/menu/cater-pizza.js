var $ = jQuery.noConflict();
var pizza_menu_items = [];

function populateChickenPizzaSelectedItems() {
	var name = "CHICKEN PIZZA";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "p_" + id;
	var pizzaSize = $('input[name=cpsize]:checked').val();
	var nPizzas = $('input[name=cpcount]').val();
	var sause = $('input[name=cpsause]:checked').val();
	var cheese = $('input[name=cpcheese]:checked').val();
	var toppings = "[" + $("input[class=cptoppings]:checked").map(function() {
		return this.value;
	}).get().join(", ") + "]";
	if (toppings == "")
		toppings = "none";
	var spl = $('input[name=cpspl]').val();
	var desc = "Size: " + pizzaSize + ", Count: " + nPizzas + ", Sause: "
			+ sause + ", Cheese: " + cheese + ", Toppings: " + toppings;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="pizza-item-close remove-item" onclick="remove_pizza_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	pizza_menu_items.push(data);
	$.magnificPopup.close();
	return false;
}

function populatePepperoniPizzaSelectedItems() {
	var name = "PEPPERONI PIZZA";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "p_" + id;
	var pizzaSize = $('input[name=ppsize]:checked').val();
	var nPizzas = $('input[name=ppcount]').val();
	var sause = $('input[name=ppsause]:checked').val();
	var cheese = $('input[name=ppcheese]:checked').val();
	var toppings = "[" + $("input[class=pptoppings]:checked").map(function() {
		return this.value;
	}).get().join(", ") + "]";
	if (toppings == "")
		toppings = "none";
	var spl = $('input[name=ppspl]').val();
	var desc = "Size: " + pizzaSize + ", Count: " + nPizzas + ", Sause: "
			+ sause + ", Cheese: " + cheese + ", Toppings: " + toppings;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="pizza-item-close remove-item" onclick="remove_pizza_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	pizza_menu_items.push(data);
	$.magnificPopup.close();
	return false;
}

function populateVeggiePizzaSelectedItems() {
	var name = "VEGGIE PIZZA";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "p_" + id;
	var pizzaSize = $('input[name=vpsize]:checked').val();
	var nPizzas = $('input[name=vpcount]').val();
	var sause = $('input[name=vpsause]:checked').val();
	var cheese = $('input[name=vpcheese]:checked').val();
	var toppings = "[" + $("input[class=vptoppings]:checked").map(function() {
		return this.value;
	}).get().join(", ") + "]";
	if (toppings == "")
		toppings = "none";
	var spl = $('input[name=vpspl]').val();
	var desc = "Size: " + pizzaSize + ", Count: " + nPizzas + ", Sause: "
			+ sause + ", Cheese: " + cheese + ", Toppings: " + toppings;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="pizza-item-close remove-item" onclick="remove_pizza_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	pizza_menu_items.push(data);
	$.magnificPopup.close();
	return false;
}

function populatePizzaSelectedItems() {
	var id = $('.slide').children().length;
	// console.log("Number of existing pizza items: " + id);
	var div_id = "p_" + id;
	var pizzaName = $("input[name=pname]").val().toUpperCase();
	var pizzaSize = $('input[name=psize]:checked').val();
	var nPizzas = $('input[name=pcount]').val();
	var sause = $('input[name=psause]:checked').val();
	var cheese = $('input[name=pcheese]:checked').val();
	var toppings = "[" + $("input[class=toppings]:checked").map(function() {
		return this.value;
	}).get().join(", ") + "]";
	if (toppings == "")
		toppings = "[none]";
	var spl = $('input[name=spl]').val();
	var desc = "Size: " + pizzaSize + ", Count: " + nPizzas + ", Sause: "
			+ sause + ", Cheese: " + cheese + ", Toppings: " + toppings;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ pizzaName
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="pizza-item-close remove-item" onclick="remove_pizza_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	$(html).appendTo('.slide');

	$('form[id=options]').find("input[type=text], textarea").val("");
	var data = pizzaName + "+" + desc;
	pizza_menu_items.push(data);
	$.magnificPopup.close();
	return false;
}