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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSuperNachosSelectedItems() {
	var name = "Super Nachos";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SuperNachosCount]').val();
	var spl = $('input[name=SuperNachosSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuAmecamecaSelectedItems() {
	var name = "Amecameca";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AmecamecaCount]').val();
	var spl = $('input[name=AmecamecaSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuMexicaliSelectedItems() {
	var name = "Mexicali";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MexicaliCount]').val();
	var spl = $('input[name=MexicaliSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuChicanoSelectedItems() {
	var name = "Chicano";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChicanoCount]').val();
	var spl = $('input[name=ChicanoSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuMahiMahiFishBurritoSelectedItems() {
	var name = "Mahi Mahi Fish Burrito";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MahiMahiFishBurritoCount]').val();
	var spl = $('input[name=MahiMahiFishBurritoSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuVeraSelectedItems() {
	var name = "Vera";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VeraCount]').val();
	var spl = $('input[name=VeraSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuXochimilcoSelectedItems() {
	var name = "Xochimilco";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=XochimilcoCount]').val();
	var spl = $('input[name=XochimilcoSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuBowlSelectedItems() {
	var name = "Bowl";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BowlCount]').val();
	var spl = $('input[name=BowlSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChalupaSelectedItems() {
	var name = "Chalupa";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChalupaCount]').val();
	var spl = $('input[name=ChalupaSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuStreetSelectedItems() {
	var name = "Street";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=StreetCount]').val();
	var spl = $('input[name=StreetSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSoftSelectedItems() {
	var name = "Soft";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SoftCount]').val();
	var spl = $('input[name=SoftSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCrispySelectedItems() {
	var name = "Crispy";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CrispyCount]').val();
	var spl = $('input[name=CrispySpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCrispyFishSelectedItems() {
	var name = "Crispy Fish";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CrispyFishCount]').val();
	var spl = $('input[name=CrispyFishSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuVeggieSelectedItems() {
	var name = "Veggie";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VeggieCount]').val();
	var spl = $('input[name=VeggieSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTacoSaladSelectedItems() {
	var name = "Taco Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TacoSaladCount]').val();
	var spl = $('input[name=TacoSaladSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuAmoreSaladSelectedItems() {
	var name = "Amore Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AmoreSaladCount]').val();
	var spl = $('input[name=AmoreSaladSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuTapatiaSaladSelectedItems() {
	var name = "Tapatia Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TapatiaSaladCount]').val();
	var spl = $('input[name=TapatiaSaladSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuMexicanSaladSelectedItems() {
	var name = "Mexican Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MexicanSaladCount]').val();
	var spl = $('input[name=MexicanSaladSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBurritoSelectedItems() {
	var name = "Burrito";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BurritoCount]').val();
	var spl = $('input[name=BurritoSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSoftTacoSelectedItems() {
	var name = "Soft Taco";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SoftTacoCount]').val();
	var spl = $('input[name=SoftTacoSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuRedChileSelectedItems() {
	var name = "Red Chile";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RedChileCount]').val();
	var spl = $('input[name=RedChileSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuGreenChileSelectedItems() {
	var name = "Green Chile";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GreenChileCount]').val();
	var spl = $('input[name=GreenChileSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuEnfrijoladasSelectedItems() {
	var name = "Enfrijoladas";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=EnfrijoladasCount]').val();
	var spl = $('input[name=EnfrijoladasSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSwissSelectedItems() {
	var name = "Swiss";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SwissCount]').val();
	var spl = $('input[name=SwissSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	chalupa_fresh_mexican_grill_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}