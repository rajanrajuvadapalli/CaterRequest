var $ = jQuery.noConflict();
var milan_curry_house_menu_items = [];

function populateFullMenuAlooTikkiSelectedItems() {
	var name = "Aloo Tikki";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AlooTikkiCount]').val();
	var spl = $('input[name=AlooTikkiSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSamosasPCSelectedItems() {
	var name = "Samosas (2PC) ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SamosasPCCount]').val();
	var spl = $('input[name=SamosasPCSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPakoraSelectedItems() {
	var name = "Pakora";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PakoraCount]').val();
	var spl = $('input[name=PakoraSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMixedVeggiePakoraSelectedItems() {
	var name = "Mixed Veggie Pakora";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MixedVeggiePakoraCount]').val();
	var spl = $('input[name=MixedVeggiePakoraSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuVegetarianWrapsSelectedItems() {
	var name = "Vegetarian Wraps";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VegetarianWrapsCount]').val();
	var spl = $('input[name=VegetarianWrapsSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPaneerWrapSelectedItems() {
	var name = "Paneer Wrap";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PaneerWrapCount]').val();
	var spl = $('input[name=PaneerWrapSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenWrapSelectedItems() {
	var name = "Chicken Wrap";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenWrapCount]').val();
	var spl = $('input[name=ChickenWrapSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuLambWrapSelectedItems() {
	var name = "Lamb Wrap ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LambWrapCount]').val();
	var spl = $('input[name=LambWrapSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuMilanTandooriSpecialSelectedItems() {
	var name = "Milan Tandoori Special";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MilanTandooriSpecialCount]').val();
	var spl = $('input[name=MilanTandooriSpecialSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMixedGrilledTandooriSelectedItems() {
	var name = "Mixed Grilled Tandoori";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MixedGrilledTandooriCount]').val();
	var spl = $('input[name=MixedGrilledTandooriSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuNaanSelectedItems() {
	var name = "Naan";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=NaanCount]').val();
	var spl = $('input[name=NaanSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPlainRotiSelectedItems() {
	var name = "Plain Roti";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PlainRotiCount]').val();
	var spl = $('input[name=PlainRotiSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuAlooKulchaSelectedItems() {
	var name = "Aloo Kulcha";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AlooKulchaCount]').val();
	var spl = $('input[name=AlooKulchaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTraditionalChickenCurrySelectedItems() {
	var name = "Traditional Chicken Curry ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TraditionalChickenCurryCount]').val();
	var spl = $('input[name=TraditionalChickenCurrySpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuButterChickenSelectedItems() {
	var name = "Butter Chicken  ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ButterChickenCount]').val();
	var spl = $('input[name=ButterChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenTikkaMasalaSelectedItems() {
	var name = "Chicken Tikka Masala";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenTikkaMasalaCount]').val();
	var spl = $('input[name=ChickenTikkaMasalaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTraditionalLambCurrySelectedItems() {
	var name = "Traditional Lamb Curry ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TraditionalLambCurryCount]').val();
	var spl = $('input[name=TraditionalLambCurrySpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSaagLambSelectedItems() {
	var name = "Saag Lamb";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SaagLambCount]').val();
	var spl = $('input[name=SaagLambSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuMalaiKoftaSelectedItems() {
	var name = "Malai Kofta";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MalaiKoftaCount]').val();
	var spl = $('input[name=MalaiKoftaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuShahiPaneerSelectedItems() {
	var name = "Shahi Paneer";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ShahiPaneerCount]').val();
	var spl = $('input[name=ShahiPaneerSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMatarPaneerSelectedItems() {
	var name = "Matar Paneer";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MatarPaneerCount]').val();
	var spl = $('input[name=MatarPaneerSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuDalMakhniSelectedItems() {
	var name = "Dal Makhni";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DalMakhniCount]').val();
	var spl = $('input[name=DalMakhniSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
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
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChanaMasalaSelectedItems() {
	var name = "Chana Masala";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChanaMasalaCount]').val();
	var spl = $('input[name=ChanaMasalaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuRaitaIndianYogurtSelectedItems() {
	var name = "Raita (Indian Yogurt)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RaitaIndianYogurtCount]').val();
	var spl = $('input[name=RaitaIndianYogurtSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBasmatiRiceSelectedItems() {
	var name = "Basmati Rice";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BasmatiRiceCount]').val();
	var spl = $('input[name=BasmatiRiceSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuKheerSelectedItems() {
	var name = "Kheer";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=KheerCount]').val();
	var spl = $('input[name=KheerSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGulabJamunSelectedItems() {
	var name = "Gulab Jamun";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GulabJamunCount]').val();
	var spl = $('input[name=GulabJamunSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuAssortedSodaSelectedItems() {
	var name = "Assorted Soda";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AssortedSodaCount]').val();
	var spl = $('input[name=AssortedSodaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBottledWaterSelectedItems() {
	var name = "Bottled Water";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BottledWaterCount]').val();
	var spl = $('input[name=BottledWaterSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_milan_curry_house_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

