var $ = jQuery.noConflict();
var chicagos_pizza_menu_items = [];

function populateFullMenuHotNSpicyTandooriWingsSelectedItems() {
	var name = "Hot-N-Spicy Tandoori Wings";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=HotNSpicyTandooriWingsCount]').val();
	var spl = $('input[name=HotNSpicyTandooriWingsSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuHoneyBBQTequilaLimeSelectedItems() {
	var name = "Honey BBQ Tequila-Lime";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=HoneyBBQTequilaLimeCount]').val();
	var spl = $('input[name=HoneyBBQTequilaLimeSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuGarlicBreadsticksSelectedItems() {
	var name = "Garlic Breadsticks";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GarlicBreadsticksCount]').val();
	var spl = $('input[name=GarlicBreadsticksSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCheeseBreadsticksSelectedItems() {
	var name = "Cheese Breadsticks";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CheeseBreadsticksCount]').val();
	var spl = $('input[name=CheeseBreadsticksSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuBaconBreadsticksSelectedItems() {
	var name = "Bacon Breadsticks";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BaconBreadsticksCount]').val();
	var spl = $('input[name=BaconBreadsticksSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuIndianStyleBreadsticksSelectedItems() {
	var name = "Indian Style Breadsticks";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=IndianStyleBreadsticksCount]').val();
	var spl = $('input[name=IndianStyleBreadsticksSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
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
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuGardenSaladSelectedItems() {
	var name = "Garden Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GardenSaladCount]').val();
	var spl = $('input[name=GardenSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenSaladSelectedItems() {
	var name = "Chicken Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenSaladCount]').val();
	var spl = $('input[name=ChickenSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuAllMeatSaladSelectedItems() {
	var name = "All Meat Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AllMeatSaladCount]').val();
	var spl = $('input[name=AllMeatSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCalzoneVeggieSelectedItems() {
	var name = "Calzone Veggie";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CalzoneVeggieCount]').val();
	var spl = $('input[name=CalzoneVeggieSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuGForceCalzoneallmeatSelectedItems() {
	var name = "G-Force Calzone (all meat)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GForceCalzoneallmeatCount]').val();
	var spl = $('input[name=GForceCalzoneallmeatSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSamosasXSelectedItems() {
	var name = "Samosas 4X";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SamosasXCount]').val();
	var spl = $('input[name=SamosasXSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuOvenBakedChickenNuggetspcSelectedItems() {
	var name = "Oven Baked Chicken Nuggets (12pc)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=OvenBakedChickenNuggetspcCount]').val();
	var spl = $('input[name=OvenBakedChickenNuggetspcSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuVeggieSandwichSelectedItems() {
	var name = "Veggie Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VeggieSandwichCount]').val();
	var spl = $('input[name=VeggieSandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenSandwichBBQorSpicySelectedItems() {
	var name = "Chicken Sandwich (BBQ or Spicy)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenSandwichBBQorSpicyCount]').val();
	var spl = $('input[name=ChickenSandwichBBQorSpicySpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuHamSandwichSelectedItems() {
	var name = "Ham Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=HamSandwichCount]').val();
	var spl = $('input[name=HamSandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTurkeySandwichSelectedItems() {
	var name = "Turkey Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TurkeySandwichCount]').val();
	var spl = $('input[name=TurkeySandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuCombinationSelectedItems() {
	var name = "Combination";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=CombinationSize]').val();
	var n = $('input[name=CombinationCount]').val();
	var spl = $('input[name=CombinationSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuVegetarianSelectedItems() {
	var name = "Vegetarian";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=VegetarianSize]').val();
	var n = $('input[name=VegetarianCount]').val();
	var spl = $('input[name=VegetarianSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuAllMeatSelectedItems() {
	var name = "All Meat";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=AllMeatSize]').val();
	var n = $('input[name=AllMeatCount]').val();
	var spl = $('input[name=AllMeatSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuAllStarsorDeluxeSelectedItems() {
	var name = "All Stars or Deluxe";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=AllStarsorDeluxeSize]').val();
	var n = $('input[name=AllStarsorDeluxeCount]').val();
	var spl = $('input[name=AllStarsorDeluxeSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuHawaiianSelectedItems() {
	var name = "Hawaiian";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=HawaiianSize]').val();
	var n = $('input[name=HawaiianCount]').val();
	var spl = $('input[name=HawaiianSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSpicyHawaiianSelectedItems() {
	var name = "Spicy Hawaiian";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=SpicyHawaiianSize]').val();
	var n = $('input[name=SpicyHawaiianCount]').val();
	var spl = $('input[name=SpicyHawaiianSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuLatinoStyleSelectedItems() {
	var name = "Latino Style";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=LatinoStyleSize]').val();
	var n = $('input[name=LatinoStyleCount]').val();
	var spl = $('input[name=LatinoStyleSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuItalianGarlicSelectedItems() {
	var name = "Italian Garlic";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=ItalianGarlicSize]').val();
	var n = $('input[name=ItalianGarlicCount]').val();
	var spl = $('input[name=ItalianGarlicSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuGarlicChickenSelectedItems() {
	var name = "Garlic Chicken";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=GarlicChickenSize]').val();
	var n = $('input[name=GarlicChickenCount]').val();
	var spl = $('input[name=GarlicChickenSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuBBQChickenSelectedItems() {
	var name = "BBQ Chicken";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=BBQChickenSize]').val();
	var n = $('input[name=BBQChickenCount]').val();
	var spl = $('input[name=BBQChickenSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenBaconRanchSelectedItems() {
	var name = "Chicken Bacon Ranch";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=ChickenBaconRanchSize]').val();
	var n = $('input[name=ChickenBaconRanchCount]').val();
	var spl = $('input[name=ChickenBaconRanchSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCheeseburgerSelectedItems() {
	var name = "Cheeseburger";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=CheeseburgerSize]').val();
	var n = $('input[name=CheeseburgerCount]').val();
	var spl = $('input[name=CheeseburgerSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChicagosFavoriteSelectedItems() {
	var name = "Chicago’s Favorite";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=ChicagosFavoriteSize]').val();
	var n = $('input[name=ChicagosFavoriteCount]').val();
	var spl = $('input[name=ChicagosFavoriteSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuThreeIdiotsTopFavoriteSelectedItems() {
	var name = "Three Idiots * Top Favorite!";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=ThreeIdiotsTopFavoriteSize]').val();
	var n = $('input[name=ThreeIdiotsTopFavoriteCount]').val();
	var spl = $('input[name=ThreeIdiotsTopFavoriteSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenDelightSelectedItems() {
	var name = "Chicken Delight";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=ChickenDelightSize]').val();
	var n = $('input[name=ChickenDelightCount]').val();
	var spl = $('input[name=ChickenDelightSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuGarlicVeggieSelectedItems() {
	var name = "Garlic Veggie";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=GarlicVeggieSize]').val();
	var n = $('input[name=GarlicVeggieCount]').val();
	var spl = $('input[name=GarlicVeggieSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTikkaMasalaVeggieSelectedItems() {
	var name = "Tikka Masala Veggie";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=TikkaMasalaVeggieSize]').val();
	var n = $('input[name=TikkaMasalaVeggieCount]').val();
	var spl = $('input[name=TikkaMasalaVeggieSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTandooriVeggiePizzaSelectedItems() {
	var name = "Tandoori Veggie Pizza";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=TandooriVeggiePizzaSize]').val();
	var n = $('input[name=TandooriVeggiePizzaCount]').val();
	var spl = $('input[name=TandooriVeggiePizzaSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCurryVeggiePizzaSelectedItems() {
	var name = "Curry Veggie Pizza";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=CurryVeggiePizzaSize]').val();
	var n = $('input[name=CurryVeggiePizzaCount]').val();
	var spl = $('input[name=CurryVeggiePizzaSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuIndianVeggiePizzaSelectedItems() {
	var name = "Indian Veggie Pizza";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=IndianVeggiePizzaSize]').val();
	var n = $('input[name=IndianVeggiePizzaCount]').val();
	var spl = $('input[name=IndianVeggiePizzaSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuLimeVeggiePizzaSelectedItems() {
	var name = "Lime Veggie Pizza";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=LimeVeggiePizzaSize]').val();
	var n = $('input[name=LimeVeggiePizzaCount]').val();
	var spl = $('input[name=LimeVeggiePizzaSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPaneerTikkaMasalaSelectedItems() {
	var name = "Paneer Tikka Masala";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=PaneerTikkaMasalaSize]').val();
	var n = $('input[name=PaneerTikkaMasalaCount]').val();
	var spl = $('input[name=PaneerTikkaMasalaSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTandooriPaneerSelectedItems() {
	var name = "Tandoori Paneer";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=TandooriPaneerSize]').val();
	var n = $('input[name=TandooriPaneerCount]').val();
	var spl = $('input[name=TandooriPaneerSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCurryPaneerSelectedItems() {
	var name = "Curry Paneer";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=CurryPaneerSize]').val();
	var n = $('input[name=CurryPaneerCount]').val();
	var spl = $('input[name=CurryPaneerSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPalakPaneerSelectedItems() {
	var name = "Palak Paneer";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=PalakPaneerSize]').val();
	var n = $('input[name=PalakPaneerCount]').val();
	var spl = $('input[name=PalakPaneerSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPaneerVeggieSelectedItems() {
	var name = "Paneer Veggie";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=PaneerVeggieSize]').val();
	var n = $('input[name=PaneerVeggieCount]').val();
	var spl = $('input[name=PaneerVeggieSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenTikkaMasalaSelectedItems() {
	var name = "Chicken Tikka Masala";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=ChickenTikkaMasalaSize]').val();
	var n = $('input[name=ChickenTikkaMasalaCount]').val();
	var spl = $('input[name=ChickenTikkaMasalaSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTandooriChickenPizzaSelectedItems() {
	var name = "Tandoori Chicken Pizza";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=TandooriChickenPizzaSize]').val();
	var n = $('input[name=TandooriChickenPizzaCount]').val();
	var spl = $('input[name=TandooriChickenPizzaSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenCurryPizzaSelectedItems() {
	var name = "Chicken Curry Pizza";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=ChickenCurryPizzaSize]').val();
	var n = $('input[name=ChickenCurryPizzaCount]').val();
	var spl = $('input[name=ChickenCurryPizzaSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuIndianGarlicChickenSelectedItems() {
	var name = "Indian Garlic Chicken";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=IndianGarlicChickenSize]').val();
	var n = $('input[name=IndianGarlicChickenCount]').val();
	var spl = $('input[name=IndianGarlicChickenSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuButterChickenSelectedItems() {
	var name = "Butter Chicken";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var size = $('input[name=ButterChickenSize]').val();
	var n = $('input[name=ButterChickenCount]').val();
	var spl = $('input[name=ButterChickenSpl]').val();
	var desc = "Size: " + size + " Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_chicagos_pizza_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}