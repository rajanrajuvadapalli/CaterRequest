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
	var n = $('input[name=tcount]').val();
	var type = $('input[name=ttype]').val();
	var servings = $('input[name=tmeat]').val();
	var sides = $('input[name=tsides]').val();
	var salsa = $('input[name=tsalsa]').val();
	var cheese = $('input[name=tcheese]').val();
	var toppings = $('input[name=ttop]').val();
	var desc = "Number of tacos: " + n + ", Tortilla type: " + type
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

function populateMexicanBurritoBarSelectedItems() {
	var name = "BURRITO BAR";
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
	var n = $('input[name=bcount]').val();
	var type = $('input[name=btype]').val();
	var servings = $('input[name=bmeat]').val();
	var sides = $('input[name=bsides]').val();
	var salsa = $('input[name=bsalsa]').val();
	var cheese = $('input[name=bcheese]').val();
	var toppings = $('input[name=btop]').val();
	var desc = "Number of burritos: " + n + ", Tortilla type: " + type
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

function populateMexicanEnchiladaBarSelectedItems() {
	var name = "ENCHILADA BAR";
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
	var n = $('input[name=ecount]').val();
	var servings = $('input[name=emeat]').val();
	var sides = $('input[name=esides]').val();
	var salsa = $('input[name=esalsa]').val();
	var cheese = $('input[name=echeese]').val();
	var toppings = $('input[name=etop]').val();
	var desc = "Number of enchiladas: " + n 
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

function populateMexicanFajithaBarSelectedItems() {
	var name = "FAJITA BAR";
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
	var n = $('input[name=fcount]').val();
	var servings = $('input[name=fmeat]').val();
	var sides = $('input[name=fsides]').val();
	var salsa = $('input[name=fsalsa]').val();
	var cheese = $('input[name=fcheese]').val();
	var toppings = $('input[name=ftop]').val();
	var desc = "Number of fajitas: " + n 
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

function populateMexicanSaladBarSelectedItems() {
	var name = "SALAD BAR";
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
	var n = $('input[name=scount]').val();
	var mainserving = $('input[name=smain]').val();
	var servings = $('input[name=smeat]').val();
	var sides = $('input[name=ssides]').val();
	var salsa = $('input[name=ssalsa]').val();
	var cheese = $('input[name=scheese]').val();
	var toppings = $('input[name=stop]').val();
	var dressing = $('input[name=sdress]').val();
	var desc = "Serving count: " + n + ", Main serving: " + mainserving
			+ ", Servings: " + servings + ", Sides: " + sides + ", Salsa: "
			+ salsa + ", Cheese: " + cheese + ", Toppings: " + toppings+ ", Dressing: " + dressing;
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

function populateMexicanChipsSelectedItems() {
	var name = "CHIPS & SALSA";
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
	var n = $('input[name=ccount]').val();
	var salsa = $('input[name=csalsa]').val();
	var desc = "Serving Count: " + n + ", Salsa: "
			+ salsa;
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


