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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCombinationPizzaLargeSelectedItems() {
	var name = "Combination Pizza(Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CombinationPizzaLargeCount]').val();
	var spl = $('input[name=CombinationPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuVegetarianPizzaLargeSelectedItems() {
	var name = "Vegetarian Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VegetarianPizzaLargeCount]').val();
	var spl = $('input[name=VegetarianPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuAllMeatPizzaLargeSelectedItems() {
	var name = "All Meat Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AllMeatPizzaLargeCount]').val();
	var spl = $('input[name=AllMeatPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuAllStarsorDeluxePizzaLargeSelectedItems() {
	var name = "All Stars or Deluxe Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AllStarsorDeluxePizzaLargeCount]').val();
	var spl = $('input[name=AllStarsorDeluxePizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuHawaiianPizzaLargeSelectedItems() {
	var name = "Hawaiian Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=HawaiianPizzaLargeCount]').val();
	var spl = $('input[name=HawaiianPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuLatinoStylePizzaLargeSelectedItems() {
	var name = "Latino Style Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LatinoStylePizzaLargeCount]').val();
	var spl = $('input[name=LatinoStylePizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuItalianGarlicPizzaLargeSelectedItems() {
	var name = "Italian Garlic Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ItalianGarlicPizzaLargeCount]').val();
	var spl = $('input[name=ItalianGarlicPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBBQChickenPizzaLargeSelectedItems() {
	var name = "BBQ Chicken Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BBQChickenPizzaLargeCount]').val();
	var spl = $('input[name=BBQChickenPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenBaconRanchPizzaLargeSelectedItems() {
	var name = "Chicken Bacon Ranch Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenBaconRanchPizzaLargeCount]').val();
	var spl = $('input[name=ChickenBaconRanchPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChicagosFavoritePizzaLargeSelectedItems() {
	var name = "Chicagoâ€™s Favorite Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChicagosFavoritePizzaLargeCount]').val();
	var spl = $('input[name=ChicagosFavoritePizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGarlicVeggiePizzaLargeSelectedItems() {
	var name = "Garlic Veggie Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GarlicVeggiePizzaLargeCount]').val();
	var spl = $('input[name=GarlicVeggiePizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTikkaMasalaVeggiePizzaLargeSelectedItems() {
	var name = "Tikka Masala Veggie Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TikkaMasalaVeggiePizzaLargeCount]').val();
	var spl = $('input[name=TikkaMasalaVeggiePizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTandooriVeggiePizzaLargeSelectedItems() {
	var name = "Tandoori Veggie Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TandooriVeggiePizzaLargeCount]').val();
	var spl = $('input[name=TandooriVeggiePizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuCurryVeggiePizzaLargeSelectedItems() {
	var name = "Curry Veggie Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CurryVeggiePizzaLargeCount]').val();
	var spl = $('input[name=CurryVeggiePizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuIndianVeggiePizzaLargeSelectedItems() {
	var name = "Indian Veggie Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=IndianVeggiePizzaLargeCount]').val();
	var spl = $('input[name=IndianVeggiePizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuLimeVeggiePizzaLargeSelectedItems() {
	var name = "Lime Veggie Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LimeVeggiePizzaLargeCount]').val();
	var spl = $('input[name=LimeVeggiePizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPaneerTikkaMasalaPizzaLargeSelectedItems() {
	var name = "Paneer Tikka Masala Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PaneerTikkaMasalaPizzaLargeCount]').val();
	var spl = $('input[name=PaneerTikkaMasalaPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTandooriPaneerPizzaLargeSelectedItems() {
	var name = "Tandoori Paneer Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TandooriPaneerPizzaLargeCount]').val();
	var spl = $('input[name=TandooriPaneerPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuCurryPaneerPizzaLargeSelectedItems() {
	var name = "Curry Paneer Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CurryPaneerPizzaLargeCount]').val();
	var spl = $('input[name=CurryPaneerPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenTikkaMasalaLargeSelectedItems() {
	var name = "Chicken Tikka Masala (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenTikkaMasalaLargeCount]').val();
	var spl = $('input[name=ChickenTikkaMasalaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTandooriChickenPizzaLargeSelectedItems() {
	var name = "Tandoori Chicken Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TandooriChickenPizzaLargeCount]').val();
	var spl = $('input[name=TandooriChickenPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenCurryPizzaLargeSelectedItems() {
	var name = "Chicken Curry Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenCurryPizzaLargeCount]').val();
	var spl = $('input[name=ChickenCurryPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuButterChickenPizzaLargeSelectedItems() {
	var name = "Butter Chicken Pizza (Large)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ButterChickenPizzaLargeCount]').val();
	var spl = $('input[name=ButterChickenPizzaLargeSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chicagos_pizza_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

