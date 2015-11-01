var $ = jQuery.noConflict();
var pizza_menu_items = [];
function populatePizzaSelectedItems() {
	// var id = Math.floor((Math.random() * 100) + 1);
	var id = $('.slide').children().length;
	console.log("Number of existing pizza items: " + id);
	var div_id = "p_" + id;
	var pizzaName = $("input[name=pname]").val().toUpperCase();
	// console.log("pizzaName="+pizzaName);
	var pizzaSize = $('input[name=psize]:checked').val();
	// console.log("pizzaSize=" + pizzaSize);
	var nPizzas = $('input[name=pcount]').val();
	// console.log("nPizzas=" + nPizzas);
	var sause = $('input[name=psause]:checked').val();
	var cheese = $('input[name=pcheese]:checked').val();
	var toppings = "";
	$('.toppings:checked').each(function() {
		toppings = toppings + " " + $(this).val();
	});
	if (toppings == "")
		toppings = "none";
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
	// console.log(html);
	$(html).appendTo('.slide');

	$('form[id=options]').find("input[type=text], textarea").val("");
	/*
	 * var pizzaDesc = "Size: " + pizzaSize + ", Count: " + nPizzas + ", Sause: " +
	 * sause + ", Cheese: " + cheese + ", Toppings: " + toppings;
	 */
	var data = pizzaName + "+" + desc;
	//console.log(data);
	pizza_menu_items.push(data);
	// console.log(pizza_menu_items);
	$.magnificPopup.close();
	return false;
}