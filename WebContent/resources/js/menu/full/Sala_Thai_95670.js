var $ = jQuery.noConflict();
var sala_thai_menu_items = [];

function populateFullMenuFreshRollsSelectedItems() {
	var name = "Fresh Rolls";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FreshRollsCount]').val();
	var spl = $('input[name=FreshRollsSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuThaiRollsSelectedItems() {
	var name = "Thai Rolls";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ThaiRollsCount]').val();
	var spl = $('input[name=ThaiRollsSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenSataySelectedItems() {
	var name = "Chicken Satay";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenSatayCount]').val();
	var spl = $('input[name=ChickenSataySpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPapayaSaladSelectedItems() {
	var name = "Papaya Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PapayaSaladCount]').val();
	var spl = $('input[name=PapayaSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuThaiSaladSelectedItems() {
	var name = "Thai Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ThaiSaladCount]').val();
	var spl = $('input[name=ThaiSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSpicyChickenSaladSelectedItems() {
	var name = "Spicy Chicken Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SpicyChickenSaladCount]').val();
	var spl = $('input[name=SpicyChickenSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenMixedVegetablesSelectedItems() {
	var name = "Chicken & Mixed Vegetables";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenMixedVegetablesCount]').val();
	var spl = $('input[name=ChickenMixedVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBeefMixedVegetablesSelectedItems() {
	var name = "Beef & Mixed Vegetables";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BeefMixedVegetablesCount]').val();
	var spl = $('input[name=BeefMixedVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPorkMixedVegetablesSelectedItems() {
	var name = "Pork & Mixed Vegetables";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PorkMixedVegetablesCount]').val();
	var spl = $('input[name=PorkMixedVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTofuMixedVegetablesSelectedItems() {
	var name = "Tofu & Mixed Vegetables";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TofuMixedVegetablesCount]').val();
	var spl = $('input[name=TofuMixedVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMixedVegetablesSelectedItems() {
	var name = "Mixed Vegetables";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MixedVegetablesCount]').val();
	var spl = $('input[name=MixedVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSweetSourBeefSelectedItems() {
	var name = "Sweet & Sour (Beef)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SweetSourBeefCount]').val();
	var spl = $('input[name=SweetSourBeefSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSweetSourChickenSelectedItems() {
	var name = "Sweet & Sour (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SweetSourChickenCount]').val();
	var spl = $('input[name=SweetSourChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSweetSourPorkSelectedItems() {
	var name = "Sweet & Sour (Pork)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SweetSourPorkCount]').val();
	var spl = $('input[name=SweetSourPorkSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSweetSourTofuSelectedItems() {
	var name = "Sweet & Sour (Tofu)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SweetSourTofuCount]').val();
	var spl = $('input[name=SweetSourTofuSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSweetSourOnlyVegetablesSelectedItems() {
	var name = "Sweet & Sour (Only Vegetables)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SweetSourOnlyVegetablesCount]').val();
	var spl = $('input[name=SweetSourOnlyVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPadThaiNoodleBeefSelectedItems() {
	var name = "Pad Thai Noodle (Beef)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PadThaiNoodleBeefCount]').val();
	var spl = $('input[name=PadThaiNoodleBeefSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPadThaiNoodleChickenSelectedItems() {
	var name = "Pad Thai Noodle (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PadThaiNoodleChickenCount]').val();
	var spl = $('input[name=PadThaiNoodleChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPadThaiNoodlePorkSelectedItems() {
	var name = "Pad Thai Noodle (Pork)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PadThaiNoodlePorkCount]').val();
	var spl = $('input[name=PadThaiNoodlePorkSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPadThaiNoodleTofuSelectedItems() {
	var name = "Pad Thai Noodle (Tofu)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PadThaiNoodleTofuCount]').val();
	var spl = $('input[name=PadThaiNoodleTofuSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPadThaiNoodleOnlyVegetablesSelectedItems() {
	var name = "Pad Thai Noodle (Only Vegetables)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PadThaiNoodleOnlyVegetablesCount]').val();
	var spl = $('input[name=PadThaiNoodleOnlyVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuDrunkenNoodlesBeefSelectedItems() {
	var name = "Drunken Noodles (Beef)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DrunkenNoodlesBeefCount]').val();
	var spl = $('input[name=DrunkenNoodlesBeefSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuDrunkenNoodlesChickenSelectedItems() {
	var name = "Drunken Noodles (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DrunkenNoodlesChickenCount]').val();
	var spl = $('input[name=DrunkenNoodlesChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuDrunkenNoodlesPorkSelectedItems() {
	var name = "Drunken Noodles (Pork)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DrunkenNoodlesPorkCount]').val();
	var spl = $('input[name=DrunkenNoodlesPorkSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuDrunkenNoodlesTofuSelectedItems() {
	var name = "Drunken Noodles (Tofu)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DrunkenNoodlesTofuCount]').val();
	var spl = $('input[name=DrunkenNoodlesTofuSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuDrunkenNoodlesOnlyVegetablesSelectedItems() {
	var name = "Drunken Noodles (Only Vegetables)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DrunkenNoodlesOnlyVegetablesCount]').val();
	var spl = $('input[name=DrunkenNoodlesOnlyVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuRedCurryBeefSelectedItems() {
	var name = "Red Curry (Beef)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RedCurryBeefCount]').val();
	var spl = $('input[name=RedCurryBeefSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuRedCurryChickenSelectedItems() {
	var name = "Red Curry (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RedCurryChickenCount]').val();
	var spl = $('input[name=RedCurryChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuRedCurryPorkSelectedItems() {
	var name = "Red Curry (Pork)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RedCurryPorkCount]').val();
	var spl = $('input[name=RedCurryPorkSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuRedCurryTofuSelectedItems() {
	var name = "Red Curry (Tofu)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RedCurryTofuCount]').val();
	var spl = $('input[name=RedCurryTofuSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuRedCurryOnlyVegetablesSelectedItems() {
	var name = "Red Curry (Only Vegetables)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RedCurryOnlyVegetablesCount]').val();
	var spl = $('input[name=RedCurryOnlyVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuYellowCurryBeefSelectedItems() {
	var name = "Yellow Curry (Beef)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=YellowCurryBeefCount]').val();
	var spl = $('input[name=YellowCurryBeefSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuYellowCurryChickenSelectedItems() {
	var name = "Yellow Curry (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=YellowCurryChickenCount]').val();
	var spl = $('input[name=YellowCurryChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuYellowCurryPorkSelectedItems() {
	var name = "Yellow Curry (Pork)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=YellowCurryPorkCount]').val();
	var spl = $('input[name=YellowCurryPorkSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuYellowCurryTofuSelectedItems() {
	var name = "Yellow Curry (Tofu)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=YellowCurryTofuCount]').val();
	var spl = $('input[name=YellowCurryTofuSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuYellowCurryOnlyVegetablesSelectedItems() {
	var name = "Yellow Curry (Only Vegetables)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=YellowCurryOnlyVegetablesCount]').val();
	var spl = $('input[name=YellowCurryOnlyVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGreenCurryBeefSelectedItems() {
	var name = "Green Curry (Beef)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GreenCurryBeefCount]').val();
	var spl = $('input[name=GreenCurryBeefSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGreenCurryChickenSelectedItems() {
	var name = "Green Curry (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GreenCurryChickenCount]').val();
	var spl = $('input[name=GreenCurryChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGreenCurryPorkSelectedItems() {
	var name = "Green Curry (Pork)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GreenCurryPorkCount]').val();
	var spl = $('input[name=GreenCurryPorkSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGreenCurryTofuSelectedItems() {
	var name = "Green Curry (Tofu)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GreenCurryTofuCount]').val();
	var spl = $('input[name=GreenCurryTofuSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGreenCurryOnlyVegetablesSelectedItems() {
	var name = "Green Curry (Only Vegetables)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GreenCurryOnlyVegetablesCount]').val();
	var spl = $('input[name=GreenCurryOnlyVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuThaiFriedRiceBeefSelectedItems() {
	var name = "Thai Fried Rice (Beef)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ThaiFriedRiceBeefCount]').val();
	var spl = $('input[name=ThaiFriedRiceBeefSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuThaiFriedRiceChickenSelectedItems() {
	var name = "Thai Fried Rice (Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ThaiFriedRiceChickenCount]').val();
	var spl = $('input[name=ThaiFriedRiceChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuThaiFriedRicePorkSelectedItems() {
	var name = "Thai Fried Rice (Pork)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ThaiFriedRicePorkCount]').val();
	var spl = $('input[name=ThaiFriedRicePorkSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuThaiFriedRiceTofuSelectedItems() {
	var name = "Thai Fried Rice (Tofu)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ThaiFriedRiceTofuCount]').val();
	var spl = $('input[name=ThaiFriedRiceTofuSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuThaiFriedRiceOnlyVegetablesSelectedItems() {
	var name = "Thai Fried Rice (Only Vegetables)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ThaiFriedRiceOnlyVegetablesCount]').val();
	var spl = $('input[name=ThaiFriedRiceOnlyVegetablesSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_sala_thai_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	sala_thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

