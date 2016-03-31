var $ = jQuery.noConflict();
var chalupa_fresh_mexican_grill_menu_items = [];

function populateFullMenuQuesoNachosSelectedItems() {
	var name = "Queso Nachos";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=QuesoNachosCount]').val();
	var spl = $('input[name=QuesoNachosSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGrilledCornMexicanStyleSelectedItems() {
	var name = "Grilled Corn Mexican Style";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GrilledCornMexicanStyleCount]').val();
	var spl = $('input[name=GrilledCornMexicanStyleSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenQuesadillaSelectedItems() {
	var name = "Chicken Quesadilla";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenQuesadillaCount]').val();
	var spl = $('input[name=ChickenQuesadillaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuVegetarianQuesadillaSelectedItems() {
	var name = "Vegetarian Quesadilla";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VegetarianQuesadillaCount]').val();
	var spl = $('input[name=VegetarianQuesadillaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTacoSalasChickenSelectedItems() {
	var name = "Taco Salas(Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TacoSalasChickenCount]').val();
	var spl = $('input[name=TacoSalasChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTacoSalasSteakSelectedItems() {
	var name = "Taco Salas(Steak)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TacoSalasSteakCount]').val();
	var spl = $('input[name=TacoSalasSteakSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTacoSalasCarnitasSelectedItems() {
	var name = "Taco Salas(Carnitas)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TacoSalasCarnitasCount]').val();
	var spl = $('input[name=TacoSalasCarnitasSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTacoSalasVegetarianSelectedItems() {
	var name = "Taco Salas(Vegetarian)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TacoSalasVegetarianCount]').val();
	var spl = $('input[name=TacoSalasVegetarianSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMexicanSaladChickenSelectedItems() {
	var name = "Mexican Salad(Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MexicanSaladChickenCount]').val();
	var spl = $('input[name=MexicanSaladChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMexicanSaladSteakSelectedItems() {
	var name = "Mexican Salad(Steak)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MexicanSaladSteakCount]').val();
	var spl = $('input[name=MexicanSaladSteakSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMexicanSaladCarnitasSelectedItems() {
	var name = "Mexican Salad(Carnitas)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MexicanSaladCarnitasCount]').val();
	var spl = $('input[name=MexicanSaladCarnitasSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMexicanSaladVegetarianSelectedItems() {
	var name = "Mexican Salad(Vegetarian)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MexicanSaladVegetarianCount]').val();
	var spl = $('input[name=MexicanSaladVegetarianSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChalupaChickenSelectedItems() {
	var name = "Chalupa(Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChalupaChickenCount]').val();
	var spl = $('input[name=ChalupaChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChalupaSteakSelectedItems() {
	var name = "Chalupa(Steak)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChalupaSteakCount]').val();
	var spl = $('input[name=ChalupaSteakSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChalupaCarnitasSelectedItems() {
	var name = "Chalupa(Carnitas)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChalupaCarnitasCount]').val();
	var spl = $('input[name=ChalupaCarnitasSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuStreetTacosChickenSelectedItems() {
	var name = "Street Tacos (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=StreetTacosChickenCount]').val();
	var spl = $('input[name=StreetTacosChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuStreetTacosSteakSelectedItems() {
	var name = "Street Tacos (Steak)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=StreetTacosSteakCount]').val();
	var spl = $('input[name=StreetTacosSteakSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuStreetTacosCarnitasSelectedItems() {
	var name = "Street Tacos (Carnitas)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=StreetTacosCarnitasCount]').val();
	var spl = $('input[name=StreetTacosCarnitasSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMahiMahiFishTacoSelectedItems() {
	var name = "Mahi Mahi Fish Taco";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MahiMahiFishTacoCount]').val();
	var spl = $('input[name=MahiMahiFishTacoSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuVeggieTacoSelectedItems() {
	var name = "Veggie Taco";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VeggieTacoCount]').val();
	var spl = $('input[name=VeggieTacoSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuAmecamecaChickenSelectedItems() {
	var name = "Amecameca(Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AmecamecaChickenCount]').val();
	var spl = $('input[name=AmecamecaChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuAmecamecaSteakSelectedItems() {
	var name = "Amecameca(Steak)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AmecamecaSteakCount]').val();
	var spl = $('input[name=AmecamecaSteakSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuAmecamecaCarnitasSelectedItems() {
	var name = "Amecameca(Carnitas)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AmecamecaCarnitasCount]').val();
	var spl = $('input[name=AmecamecaCarnitasSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMexicaliChickenSelectedItems() {
	var name = "Mexicali (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MexicaliChickenCount]').val();
	var spl = $('input[name=MexicaliChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMexicaliSteakSelectedItems() {
	var name = "Mexicali (Steak)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MexicaliSteakCount]').val();
	var spl = $('input[name=MexicaliSteakSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMexicaliCarnitasSelectedItems() {
	var name = "Mexicali (Carnitas)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MexicaliCarnitasCount]').val();
	var spl = $('input[name=MexicaliCarnitasSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chalupa_fresh_mexican_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

