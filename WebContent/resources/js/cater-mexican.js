var $ = jQuery.noConflict();
var mexican_menu_items = [];
function populateMexicanTacoBarSelectedItems() {
	var name = "TACO BAR";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=tcount]').val();
	var tortillaSize = $('input[name=ttsize]').val();
	var type = $('input[name=ttype]:checked').val();
	var servings = $("input[name=tmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var beans = $("input[name=tbeans]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var rice = $("input[name=trice]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var salsa = $("input[name=tsalsa]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var cheese = $("input[name=tcheese]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var toppings = $("input[name=ttop]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var spl = $('input[name=tspl]').val();
	var desc = "Number of tacos: " + n + ", Tortilla type: " + type
			+ ", Tortilla size: " + tortillaSize
			+ ", Beans: " + beans + ", Rice: " + rice + ", Salsa: " + salsa
			+ ", Cheese: " + cheese;
	if (servings != "")
		desc += ", Servings: " + servings;
	if (toppings != "")
		desc += ", Toppings: " + toppings;
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
			+ '<span class="mexican-item-close remove-item" onclick="remove_mexican_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	mexican_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateMexicanBurritoBarSelectedItems() {
	var name = "BURRITO BAR";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=bcount]').val();
	var tortillaSize = $('input[name=btsize]').val();
	var type = $('input[name=btype]:checked').val();
	var servings = $("input[name=bmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var beans = $("input[name=bbeans]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var rice = $('input[name=brice]:checked').val();
	var salsa = $('input[name=bsalsa]:checked').val();
	var cheese = $('input[name=bcheese]:checked').val();
	var toppings = $("input[name=btop]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var spl = $('input[name=bspl]').val();
	var desc = "Number of burritos: " + n + ", Tortilla type: " + type
			+ ", Tortilla size: " + tortillaSize
			+ ", Beans: " + beans + ", Rice: " + rice + ", Salsa: " + salsa
			+ ", Cheese: " + cheese;
	if (servings != "")
		desc += ", Servings: " + servings;
	if (toppings != "")
		desc += ", Toppings: " + toppings;
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
			+ '<span class="mexican-item-close remove-item" onclick="remove_mexican_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	mexican_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateMexicanEnchiladaBarSelectedItems() {
	var name = "ENCHILADA BAR";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ecount]').val();
	var tortillaSize = $('input[name=etsize]').val();
	var type = $('input[name=etype]:checked').val();
	var servings = $("input[name=emeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var beans = $("input[name=ebeans]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var rice = $('input[name=erice]:checked').val();
	var salsa = $('input[name=esalsa]:checked').val();
	var cheese = $('input[name=echeese]:checked').val();
	var toppings = $("input[name=etop]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var sauseType = $("input[name=esausetype]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var spl = $('input[name=espl]').val();
	var desc = "Number of enchiladas: " + n + ", Tortilla type: " + type 
			+ ", Tortilla size: " + tortillaSize
			+ ", Beans: " + beans + ", Rice: "
			+ rice + ", Salsa: " + salsa + ", Cheese: " + cheese;
	if (servings != "")
		desc += ", Servings: " + servings;
	if (toppings != "")
		desc += ", Toppings: " + toppings;
	if (sauseType != "")
		desc += ", Sause Type: " + sauseType;
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
			+ '<span class="mexican-item-close remove-item" onclick="remove_mexican_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	mexican_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateMexicanFajithaBarSelectedItems() {
	var name = "FAJITA BAR";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=fcount]').val();
	var tortillaSize = $('input[name=ftsize]').val();
	var servings = $("input[name=fmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var beans = $("input[name=fbeans]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var rice = $('input[name=frice]:checked').val();
	var salsa = $('input[name=fsalsa]:checked').val();
	var cheese = $('input[name=fcheese]:checked').val();
	var toppings = $("input[name=ftop]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var spl = $('input[name=fspl]').val();
	var desc = "Number of fajitas: " + n 
			+ ", Tortilla size: " + tortillaSize
			+ ", Beans: " + beans + ", Rice: "
			+ rice + ", Salsa: " + salsa + ", Cheese: " + cheese;
	if (servings != "")
		desc += ", Servings: " + servings;
	if (toppings != "")
		desc += ", Toppings: " + toppings;
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
			+ '<span class="mexican-item-close remove-item" onclick="remove_mexican_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	mexican_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateMexicanSaladBarSelectedItems() {
	var name = "SALAD BAR";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=scount]').val();
	var mainserving = $('input[name=smain]:checked').val();
	var servings = $("input[name=smeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var beans = $("input[name=sbeans]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var rice = $('input[name=srice]:checked').val();
	var salsa = $('input[name=ssalsa]:checked').val();
	var cheese = $('input[name=scheese]:checked').val();
	var toppings = $("input[name=stop]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var dressing = $('input[name=sdress]:checked').val();
	var spl = $('input[name=sspl]').val();
	var desc = "Serving count: " + n + ", Main serving: " + mainserving
			+ ", Beans: " + beans + ", Rice: " + rice + ", Salsa: " + salsa
			+ ", Cheese: " + cheese + ", Dressing: " + dressing;
	if (servings != "")
		desc += ", Servings: " + servings;
	if (toppings != "")
		desc += ", Toppings: " + toppings;
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
			+ '<span class="mexican-item-close remove-item" onclick="remove_mexican_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	mexican_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateMexicanChipsSelectedItems() {
	var name = "CHIPS and SALSA";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ccount]').val();
	var salsa = $('input[name=csalsa]:checked').val();
	var guacamole = $("input[name=cguac]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var spl = $('input[name=cspl]').val();
	var desc = "Serving Count: " + n + ", Salsa: " + salsa;
	if (guacamole != "")
		desc += ", Guacamole: " + guacamole;
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
			+ '<span class="mexican-item-close remove-item" onclick="remove_mexican_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	mexican_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
