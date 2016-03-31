var $ = jQuery.noConflict();
var south_beach_grill_menu_items = [];

function populateFullMenuSouthBeachBaconBurgerwithFriesSelectedItems() {
	var name = "South Beach Bacon Burger with Fries";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SouthBeachBaconBurgerwithFriesCount]').val();
	var spl = $('input[name=SouthBeachBaconBurgerwithFriesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSouthBeachBaconBurgerwithSaladSelectedItems() {
	var name = "South Beach Bacon Burger with Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SouthBeachBaconBurgerwithSaladCount]').val();
	var spl = $('input[name=SouthBeachBaconBurgerwithSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBigMamaBurgerwithFriesSelectedItems() {
	var name = "Big Mama Burger with Fries";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BigMamaBurgerwithFriesCount]').val();
	var spl = $('input[name=BigMamaBurgerwithFriesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBigMamaBurgerwithSaladSelectedItems() {
	var name = "Big Mama Burger with Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BigMamaBurgerwithSaladCount]').val();
	var spl = $('input[name=BigMamaBurgerwithSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMimisBurgerwithFriesSelectedItems() {
	var name = "Mimi's Burger with Fries";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MimisBurgerwithFriesCount]').val();
	var spl = $('input[name=MimisBurgerwithFriesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMimisBurgerwithSaladSelectedItems() {
	var name = "Mimi's Burger with Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MimisBurgerwithSaladCount]').val();
	var spl = $('input[name=MimisBurgerwithSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuIlisBurgerSelectedItems() {
	var name = "Ili's Burger";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=IlisBurgerCount]').val();
	var spl = $('input[name=IlisBurgerSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuDomainBurgerlbSelectedItems() {
	var name = "Domain Burger 1/3 lb";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DomainBurgerlbCount]').val();
	var spl = $('input[name=DomainBurgerlbSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuJuicyCarneAsadaSelectedItems() {
	var name = "Juicy Carne Asada";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=JuicyCarneAsadaCount]').val();
	var spl = $('input[name=JuicyCarneAsadaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSavoryCarnitasSelectedItems() {
	var name = "Savory Carnitas";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SavoryCarnitasCount]').val();
	var spl = $('input[name=SavoryCarnitasSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTenderChickenSelectedItems() {
	var name = "Tender Chicken";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TenderChickenCount]').val();
	var spl = $('input[name=TenderChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBeerBatteredCodSelectedItems() {
	var name = "Beer Battered Cod";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BeerBatteredCodCount]').val();
	var spl = $('input[name=BeerBatteredCodSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuBurritoGrandeCarneAsadaSelectedItems() {
	var name = "Burrito Grande (Carne Asada)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BurritoGrandeCarneAsadaCount]').val();
	var spl = $('input[name=BurritoGrandeCarneAsadaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBurritoGrandeCarnitasSelectedItems() {
	var name = "Burrito Grande (Carnitas)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BurritoGrandeCarnitasCount]').val();
	var spl = $('input[name=BurritoGrandeCarnitasSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBurritoGrandeChickenSelectedItems() {
	var name = "Burrito Grande (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BurritoGrandeChickenCount]').val();
	var spl = $('input[name=BurritoGrandeChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBurritoGrandeNoMeatSelectedItems() {
	var name = "Burrito Grande (No Meat)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BurritoGrandeNoMeatCount]').val();
	var spl = $('input[name=BurritoGrandeNoMeatSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuCarneAsadaFriesSelectedItems() {
	var name = "Carne Asada Fries";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CarneAsadaFriesCount]').val();
	var spl = $('input[name=CarneAsadaFriesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCarneAsadaPlateCornTortillaSelectedItems() {
	var name = "Carne Asada Plate(Corn Tortilla)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CarneAsadaPlateCornTortillaCount]').val();
	var spl = $('input[name=CarneAsadaPlateCornTortillaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuCarneAsadaPlateFlourTortillaSelectedItems() {
	var name = "Carne Asada Plate(Flour Tortilla)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CarneAsadaPlateFlourTortillaCount]').val();
	var spl = $('input[name=CarneAsadaPlateFlourTortillaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuCarnitasPlateCornTortillaSelectedItems() {
	var name = "Carnitas Plate(Corn Tortilla)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CarnitasPlateCornTortillaCount]').val();
	var spl = $('input[name=CarnitasPlateCornTortillaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuCarnitasPlateFlourTortillaSelectedItems() {
	var name = "Carnitas Plate(Flour Tortilla)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CarnitasPlateFlourTortillaCount]').val();
	var spl = $('input[name=CarnitasPlateFlourTortillaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuGrilledChickenSaladSelectedItems() {
	var name = "Grilled Chicken Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GrilledChickenSaladCount]').val();
	var spl = $('input[name=GrilledChickenSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuCaesarSaladSelectedItems() {
	var name = "Caesar Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CaesarSaladCount]').val();
	var spl = $('input[name=CaesarSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGreenSaladSelectedItems() {
	var name = "Green Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GreenSaladCount]').val();
	var spl = $('input[name=GreenSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuFriesSelectedItems() {
	var name = "Fries";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FriesCount]').val();
	var spl = $('input[name=FriesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuOnionRingsSelectedItems() {
	var name = "Onion Rings";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=OnionRingsCount]').val();
	var spl = $('input[name=OnionRingsSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuFreshGuacamoleSelectedItems() {
	var name = "Fresh Guacamole";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FreshGuacamoleCount]').val();
	var spl = $('input[name=FreshGuacamoleSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChipsSalsaSelectedItems() {
	var name = "Chips & Salsa";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChipsSalsaCount]').val();
	var spl = $('input[name=ChipsSalsaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuWaterSelectedItems() {
	var name = "Water";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=WaterCount]').val();
	var spl = $('input[name=WaterSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_south_beach_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	south_beach_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

