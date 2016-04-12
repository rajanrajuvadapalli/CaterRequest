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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#AlooTikkiCloseBtn').click();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#SamosasPCCloseBtn').click();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#PakoraCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#MixedVeggiePakoraCloseBtn').click();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#VegetarianWrapsCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#PaneerWrapCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#ChickenWrapCloseBtn').click();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#LambWrapCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#MilanTandooriSpecialCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#MixedGrilledTandooriCloseBtn').click();
	return false;
}

function populateFullMenuNaan1SelectedItems() {
	var name = "Naan";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=Naan1Count]').val();
	var spl = $('input[name=Naan1Spl]').val();
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
	// $.magnificPopup.close();
	$('button#Naan1CloseBtn').click();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#PlainRotiCloseBtn').click();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#AlooKulchaCloseBtn').click();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#TraditionalChickenCurryCloseBtn').click();
	return false;
}
function populateFullMenuButterChicken1SelectedItems() {
	var name = "Butter Chicken  ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ButterChicken1Count]').val();
	var spl = $('input[name=ButterChicken1Spl]').val();
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
	// $.magnificPopup.close();
	$('button#ButterChicken1CloseBtn').click();
	return false;
}
function populateFullMenuChickenTikkaMasala1SelectedItems() {
	var name = "Chicken Tikka Masala";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenTikkaMasala1Count]').val();
	var spl = $('input[name=ChickenTikkaMasala1Spl]').val();
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
	// $.magnificPopup.close();
	$('button#ChickenTikkaMasala1CloseBtn').click();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	milan_curry_house_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#TraditionalLambCurryCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#SaagLambCloseBtn').click();
	return false;
}

function populateFullMenuMalaiKofta1SelectedItems() {
	var name = "Malai Kofta";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MalaiKofta1Count]').val();
	var spl = $('input[name=MalaiKofta1Spl]').val();
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
	// $.magnificPopup.close();
	$('button#MalaiKofta1CloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#ShahiPaneerCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#MatarPaneerCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#DalMakhniCloseBtn').click();
	return false;
}
function populateFullMenuMixedVegetables1SelectedItems() {
	var name = "Mixed Vegetables";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MixedVegetables1Count]').val();
	var spl = $('input[name=MixedVegetables1Spl]').val();
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
	// $.magnificPopup.close();
	$('button#MixedVegetables1CloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#ChanaMasalaCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#RaitaIndianYogurtCloseBtn').click();
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
	// $.magnificPopup.close();
	$('button#BasmatiRiceCloseBtn').click();
	return false;
}

function populateFullMenuKheer1SelectedItems() {
	var name = "Kheer";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=Kheer1Count]').val();
	var spl = $('input[name=Kheer1Spl]').val();
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
	// $.magnificPopup.close();
	$('button#Kheer1CloseBtn').click();
	return false;
}
function populateFullMenuGulabJamun1SelectedItems() {
	var name = "Gulab Jamun";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GulabJamun1Count]').val();
	var spl = $('input[name=GulabJamun1Spl]').val();
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
	// $.magnificPopup.close();
	$('button#GulabJamun1CloseBtn').click();
	return false;
}

function populateFullMenuAssortedSoda1SelectedItems() {
	var name = "Assorted Soda";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AssortedSoda1Count]').val();
	var spl = $('input[name=AssortedSoda1Spl]').val();
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
	// $.magnificPopup.close();
	$('button#AssortedSoda1CloseBtn').click();
	return false;
}
function populateFullMenuBottledWater1SelectedItems() {
	var name = "Bottled Water";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BottledWater1Count]').val();
	var spl = $('input[name=BottledWater1Spl]').val();
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
	// $.magnificPopup.close();
	$('button#BottledWater1CloseBtn').click();
	return false;
}
