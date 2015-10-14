var $ = jQuery.noConflict();
var mexican_menu_items = [];
function populateMexicanTacoBarSelectedItems() {
	var name = "TACO BAR";
	//If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each (
		function(){
			if($(this).html().indexOf(name) >= 0) {
				$(this).remove();
			}
		}
	);
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var nTacos = $('input[name=tcount]').val();
	var type = $('input[name=ttype]').val();
	var servings = $('input[name=tmeat]').val();
	var sides = $('input[name=tsides]').val();
	var salsa = $('input[name=tsalsa]').val();
	var cheese = $('input[name=tcheese]').val();
	var toppings = $('input[name=ttop]').val();
	var desc = "Number of tacos: " + nTacos + ", Tortilla type: " + type
			+ ", Servings: " + servings + ", Sides: " + sides + ", Salsa: "
			+ salsa + ", Cheese: " + cheese + ", Toppings: " + toppings;
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
			+ '<span class="pizza-item-close remove-item" onclick="remove_mexican_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	mexican_menu_items.push(data);
	console.log(data);
	return false;
}
