var $ = jQuery.noConflict();
var milan_curry_house_menu_items = [];

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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuFishWrapSelectedItems() {
	var name = "Fish Wrap";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FishWrapCount]').val();
	var spl = $('input[name=FishWrapSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuLambWrapSelectedItems() {
	var name = "Lamb Wrap";
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPanniPuriPCSelectedItems() {
	var name = "Panni Puri (8 PC)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PanniPuriPCCount]').val();
	var spl = $('input[name=PanniPuriPCSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPanniPuriPCSelectedItems() {
	var name = "Panni Puri (20 PC)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PanniPuriPCCount]').val();
	var spl = $('input[name=PanniPuriPCSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSamosasPCSelectedItems() {
	var name = "Samosas (2PC)";
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuBhelPuriSelectedItems() {
	var name = "Bhel Puri";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BhelPuriCount]').val();
	var spl = $('input[name=BhelPuriSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuDhaiVadaSelectedItems() {
	var name = "Dhai Vada";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DhaiVadaCount]').val();
	var spl = $('input[name=DhaiVadaSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCholeyBhatureSelectedItems() {
	var name = "Choley Bhature";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CholeyBhatureCount]').val();
	var spl = $('input[name=CholeyBhatureSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPaneerPakoraIndianCheeseSelectedItems() {
	var name = "Paneer Pakora (Indian Cheese)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PaneerPakoraIndianCheeseCount]').val();
	var spl = $('input[name=PaneerPakoraIndianCheeseSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuFishPakoraSelectedItems() {
	var name = "Fish Pakora";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FishPakoraCount]').val();
	var spl = $('input[name=FishPakoraSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPapriChaatSelectedItems() {
	var name = "Papri Chaat";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PapriChaatCount]').val();
	var spl = $('input[name=PapriChaatSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuAlooTikkiChaatSelectedItems() {
	var name = "Aloo Tikki Chaat";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AlooTikkiChaatCount]').val();
	var spl = $('input[name=AlooTikkiChaatSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSamosaChaatSelectedItems() {
	var name = "Samosa Chaat";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SamosaChaatCount]').val();
	var spl = $('input[name=SamosaChaatSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuRangSaladSelectedItems() {
	var name = "Rang Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RangSaladCount]').val();
	var spl = $('input[name=RangSaladSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenTikkaSaladSelectedItems() {
	var name = "Chicken Tikka Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenTikkaSaladCount]').val();
	var spl = $('input[name=ChickenTikkaSaladSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCucumberSaladSelectedItems() {
	var name = "Cucumber Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CucumberSaladCount]').val();
	var spl = $('input[name=CucumberSaladSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuLambSeekhKabobSelectedItems() {
	var name = "Lamb Seekh Kabob";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LambSeekhKabobCount]').val();
	var spl = $('input[name=LambSeekhKabobSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenSeekhKabobSelectedItems() {
	var name = "Chicken Seekh Kabob";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenSeekhKabobCount]').val();
	var spl = $('input[name=ChickenSeekhKabobSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuLambVindalooSelectedItems() {
	var name = "Lamb Vindaloo";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LambVindalooCount]').val();
	var spl = $('input[name=LambVindalooSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenVindalooSelectedItems() {
	var name = "Chicken Vindaloo";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenVindalooCount]').val();
	var spl = $('input[name=ChickenVindalooSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenTandooriSelectedItems() {
	var name = "Chicken Tandoori";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenTandooriCount]').val();
	var spl = $('input[name=ChickenTandooriSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenTikkaKabobSelectedItems() {
	var name = "Chicken Tikka Kabob";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenTikkaKabobCount]').val();
	var spl = $('input[name=ChickenTikkaKabobSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuFishTandooriSelectedItems() {
	var name = "Fish Tandoori";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FishTandooriCount]').val();
	var spl = $('input[name=FishTandooriSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPaneerTandooriSelectedItems() {
	var name = "Paneer Tandoori";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PaneerTandooriCount]').val();
	var spl = $('input[name=PaneerTandooriSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuPlainNaanWButterSelectedItems() {
	var name = "Plain Naan (W/ Butter)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PlainNaanWButterCount]').val();
	var spl = $('input[name=PlainNaanWButterSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuGarlicNaanWButterMincedGarlicSelectedItems() {
	var name = "Garlic Naan (W/ Butter Minced Garlic)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GarlicNaanWButterMincedGarlicCount]').val();
	var spl = $('input[name=GarlicNaanWButterMincedGarlicSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPaneerKulchaIndianCheeseSelectedItems() {
	var name = "Paneer Kulcha (Indian Cheese)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PaneerKulchaIndianCheeseCount]').val();
	var spl = $('input[name=PaneerKulchaIndianCheeseSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuKeemaKulchaGroundMeatSelectedItems() {
	var name = "Keema Kulcha (Ground Meat)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=KeemaKulchaGroundMeatCount]').val();
	var spl = $('input[name=KeemaKulchaGroundMeatSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPyaajKulchaDicedOnionSelectedItems() {
	var name = "Pyaaj Kulcha (Diced Onion)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PyaajKulchaDicedOnionCount]').val();
	var spl = $('input[name=PyaajKulchaDicedOnionSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuAlooKulchaMincedpotatoesSelectedItems() {
	var name = "Aloo Kulcha (Minced potatoes)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AlooKulchaMincedpotatoesCount]').val();
	var spl = $('input[name=AlooKulchaMincedpotatoesSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPlainRotiChapatiSelectedItems() {
	var name = "Plain Roti / Chapati";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PlainRotiChapatiCount]').val();
	var spl = $('input[name=PlainRotiChapatiSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuVegetarianBiryaniSelectedItems() {
	var name = "Vegetarian Biryani";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VegetarianBiryaniCount]').val();
	var spl = $('input[name=VegetarianBiryaniSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChickenBiryaniSelectedItems() {
	var name = "Chicken Biryani";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenBiryaniCount]').val();
	var spl = $('input[name=ChickenBiryaniSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuLambBiryaniSelectedItems() {
	var name = "Lamb Biryani";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LambBiryaniCount]').val();
	var spl = $('input[name=LambBiryaniSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTraditionalChickenCurrySelectedItems() {
	var name = "Traditional Chicken Curry";
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuButterChickenSelectedItems() {
	var name = "Butter Chicken";
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChiliChickenSelectedItems() {
	var name = "Chili Chicken";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChiliChickenCount]').val();
	var spl = $('input[name=ChiliChickenSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSaagChickenSelectedItems() {
	var name = "Saag Chicken";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SaagChickenCount]').val();
	var spl = $('input[name=SaagChickenSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTraditionalLambCurrySelectedItems() {
	var name = "Traditional Lamb Curry";
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTraditionalGoatCurryOccasionalSelectedItems() {
	var name = "Traditional Goat Curry (Occasional)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TraditionalGoatCurryOccasionalCount]').val();
	var spl = $('input[name=TraditionalGoatCurryOccasionalSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTraditionalFishCurrySelectedItems() {
	var name = "Traditional Fish Curry";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TraditionalFishCurryCount]').val();
	var spl = $('input[name=TraditionalFishCurrySpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChiliPaneerSelectedItems() {
	var name = "Chili Paneer";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChiliPaneerCount]').val();
	var spl = $('input[name=ChiliPaneerSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuPaneerBurjiSelectedItems() {
	var name = "Paneer Burji";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PaneerBurjiCount]').val();
	var spl = $('input[name=PaneerBurjiSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSaagPaneerSelectedItems() {
	var name = "Saag Paneer";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SaagPaneerCount]').val();
	var spl = $('input[name=SaagPaneerSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuBhindiMasalaSelectedItems() {
	var name = "Bhindi Masala";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BhindiMasalaCount]').val();
	var spl = $('input[name=BhindiMasalaSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChiliOnionsCarrotsetcSelectedItems() {
	var name = "Chili, Onions, Carrots, etc.";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChiliOnionsCarrotsetcCount]').val();
	var spl = $('input[name=ChiliOnionsCarrotsetcSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuAchaarIndianPicklesSelectedItems() {
	var name = "Achaar (Indian Pickles)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AchaarIndianPicklesCount]').val();
	var spl = $('input[name=AchaarIndianPicklesSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChutneyIndianSauceSelectedItems() {
	var name = "Chutney (Indian Sauce)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChutneyIndianSauceCount]').val();
	var spl = $('input[name=ChutneyIndianSauceSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuFaloodaKulfiIndianIceCreamSelectedItems() {
	var name = "Falooda Kulfi (Indian Ice Cream)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FaloodaKulfiIndianIceCreamCount]').val();
	var spl = $('input[name=FaloodaKulfiIndianIceCreamSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuKheerIndianRicePuddingSelectedItems() {
	var name = "Kheer (Indian Rice Pudding)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=KheerIndianRicePuddingCount]').val();
	var spl = $('input[name=KheerIndianRicePuddingSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuGulabJamunSpongyBallsWSyrupSelectedItems() {
	var name = "Gulab Jamun (Spongy Balls W/ Syrup)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GulabJamunSpongyBallsWSyrupCount]').val();
	var spl = $('input[name=GulabJamunSpongyBallsWSyrupSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuRasmalaiCheesecakeWCreamSelectedItems() {
	var name = "Rasmalai (Cheesecake W/ Cream)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RasmalaiCheesecakeWCreamCount]').val();
	var spl = $('input[name=RasmalaiCheesecakeWCreamSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSweetSaltyLassiYogurtDrinkSelectedItems() {
	var name = "Sweet & Salty Lassi (Yogurt Drink)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SweetSaltyLassiYogurtDrinkCount]').val();
	var spl = $('input[name=SweetSaltyLassiYogurtDrinkSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuMangoLassiSweetMangoDrinkSelectedItems() {
	var name = "Mango Lassi (Sweet Mango Drink)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MangoLassiSweetMangoDrinkCount]').val();
	var spl = $('input[name=MangoLassiSweetMangoDrinkSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuMasalaChaiIndianTeaWSpicesSelectedItems() {
	var name = "Masala Chai (Indian Tea W/ Spices)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MasalaChaiIndianTeaWSpicesCount]').val();
	var spl = $('input[name=MasalaChaiIndianTeaWSpicesSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCoffeeWCreamSelectedItems() {
	var name = "Coffee W/ Cream";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CoffeeWCreamCount]').val();
	var spl = $('input[name=CoffeeWCreamSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuDrinksCokeCoSelectedItems() {
	var name = "Drinks (Coke Co.)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DrinksCokeCoCount]').val();
	var spl = $('input[name=DrinksCokeCoSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}