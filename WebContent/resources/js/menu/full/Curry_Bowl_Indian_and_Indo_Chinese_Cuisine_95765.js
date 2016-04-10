var $ = jQuery.noConflict();
var curry_bowl_indian_and_indo_chinese_cuisine_menu_items = [];

function populateFullMenuVegetableSamosa1SelectedItems() {
	var name = "Vegetable Samosa";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VegetableSamosa1Count]').val();
	var spl = $('input[name=VegetableSamosa1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#VegetableSamosa1CloseBtn').click();
	return false;
}
function populateFullMenuVegetableCutlet1SelectedItems() {
	var name = "Vegetable Cutlet";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VegetableCutlet1Count]').val();
	var spl = $('input[name=VegetableCutlet1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#VegetableCutlet1CloseBtn').click();
	return false;
}
function populateFullMenuOnionPakoraSelectedItems() {
	var name = "Onion Pakora";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=OnionPakoraCount]').val();
	var spl = $('input[name=OnionPakoraSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#OnionPakoraCloseBtn').click();
	return false;
}
function populateFullMenuMixedVegetablePakoraSelectedItems() {
	var name = "Mixed Vegetable Pakora";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MixedVegetablePakoraCount]').val();
	var spl = $('input[name=MixedVegetablePakoraSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#MixedVegetablePakoraCloseBtn').click();
	return false;
}
function populateFullMenuGobiManchurianSelectedItems() {
	var name = "Gobi Manchurian";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GobiManchurianCount]').val();
	var spl = $('input[name=GobiManchurianSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#GobiManchurianCloseBtn').click();
	return false;
}
function populateFullMenuChickenLillyPopSelectedItems() {
	var name = "Chicken Lilly Pop";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenLillyPopCount]').val();
	var spl = $('input[name=ChickenLillyPopSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChickenLillyPopCloseBtn').click();
	return false;
}
function populateFullMenuChickenTikkaSelectedItems() {
	var name = "Chicken Tikka";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenTikkaCount]').val();
	var spl = $('input[name=ChickenTikkaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChickenTikkaCloseBtn').click();
	return false;
}
function populateFullMenuChicken1SelectedItems() {
	var name = "Chicken 65";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=Chicken1Count]').val();
	var spl = $('input[name=Chicken1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#Chicken1CloseBtn').click();
	return false;
}
function populateFullMenuTandooriShrimpSelectedItems() {
	var name = "Tandoori Shrimp";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TandooriShrimpCount]').val();
	var spl = $('input[name=TandooriShrimpSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#TandooriShrimpCloseBtn').click();
	return false;
}

function populateFullMenuVegetableBiryaniSelectedItems() {
	var name = "Vegetable Biryani";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VegetableBiryaniCount]').val();
	var spl = $('input[name=VegetableBiryaniSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#VegetableBiryaniCloseBtn').click();
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
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChickenBiryaniCloseBtn').click();
	return false;
}
function populateFullMenuCurryBowlSpChickenBiryaniSelectedItems() {
	var name = "Curry Bowl (Sp) Chicken Biryani";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CurryBowlSpChickenBiryaniCount]').val();
	var spl = $('input[name=CurryBowlSpChickenBiryaniSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#CurryBowlSpChickenBiryaniCloseBtn').click();
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
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#LambBiryaniCloseBtn').click();
	return false;
}

function populateFullMenuRiceSelectedItems() {
	var name = "Rice";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=RiceCount]').val();
	var spl = $('input[name=RiceSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#RiceCloseBtn').click();
	return false;
}
function populateFullMenuYogurtRiceSelectedItems() {
	var name = "Yogurt Rice";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=YogurtRiceCount]').val();
	var spl = $('input[name=YogurtRiceSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#YogurtRiceCloseBtn').click();
	return false;
}

function populateFullMenuAlooGobi1SelectedItems() {
	var name = "Aloo Gobi";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AlooGobi1Count]').val();
	var spl = $('input[name=AlooGobi1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#AlooGobi1CloseBtn').click();
	return false;
}
function populateFullMenuBainganBhurtaSelectedItems() {
	var name = "Baingan Bhurta";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BainganBhurtaCount]').val();
	var spl = $('input[name=BainganBhurtaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#BainganBhurtaCloseBtn').click();
	return false;
}
function populateFullMenuChannaMasala1SelectedItems() {
	var name = "Channa Masala";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChannaMasala1Count]').val();
	var spl = $('input[name=ChannaMasala1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChannaMasala1CloseBtn').click();
	return false;
}
function populateFullMenuMixedVegetableKormaSelectedItems() {
	var name = "Mixed Vegetable Korma";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MixedVegetableKormaCount]').val();
	var spl = $('input[name=MixedVegetableKormaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#MixedVegetableKormaCloseBtn').click();
	return false;
}
function populateFullMenuChickenCurry1SelectedItems() {
	var name = "Chicken Curry";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenCurry1Count]').val();
	var spl = $('input[name=ChickenCurry1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChickenCurry1CloseBtn').click();
	return false;
}
function populateFullMenuChickenTikkaMasalaSignatureSelectedItems() {
	var name = "Chicken Tikka Masala Signature";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenTikkaMasalaSignatureCount]').val();
	var spl = $('input[name=ChickenTikkaMasalaSignatureSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChickenTikkaMasalaSignatureCloseBtn').click();
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
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ButterChickenCloseBtn').click();
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
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChickenVindalooCloseBtn').click();
	return false;
}
function populateFullMenuLambCurry1SelectedItems() {
	var name = "Lamb Curry";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LambCurry1Count]').val();
	var spl = $('input[name=LambCurry1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#LambCurry1CloseBtn').click();
	return false;
}
function populateFullMenuMuttonRoganJoshSelectedItems() {
	var name = "Mutton Rogan Josh";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MuttonRoganJoshCount]').val();
	var spl = $('input[name=MuttonRoganJoshSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#MuttonRoganJoshCloseBtn').click();
	return false;
}
function populateFullMenuLambKormaSelectedItems() {
	var name = "Lamb Korma";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LambKormaCount]').val();
	var spl = $('input[name=LambKormaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#LambKormaCloseBtn').click();
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
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#LambVindalooCloseBtn').click();
	return false;
}

function populateFullMenuTandooriRotiSelectedItems() {
	var name = "Tandoori Roti";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TandooriRotiCount]').val();
	var spl = $('input[name=TandooriRotiSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#TandooriRotiCloseBtn').click();
	return false;
}
function populateFullMenuPlainNaanSelectedItems() {
	var name = "Plain Naan";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=PlainNaanCount]').val();
	var spl = $('input[name=PlainNaanSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#PlainNaanCloseBtn').click();
	return false;
}
function populateFullMenuButterNaanSelectedItems() {
	var name = "Butter Naan";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ButterNaanCount]').val();
	var spl = $('input[name=ButterNaanSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ButterNaanCloseBtn').click();
	return false;
}
function populateFullMenuAlooParataSelectedItems() {
	var name = "Aloo Parata";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=AlooParataCount]').val();
	var spl = $('input[name=AlooParataSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#AlooParataCloseBtn').click();
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
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#GulabJamunCloseBtn').click();
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
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#KheerCloseBtn').click();
	return false;
}
function populateFullMenuBreadHalwaSelectedItems() {
	var name = "Bread Halwa";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BreadHalwaCount]').val();
	var spl = $('input[name=BreadHalwaSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	curry_bowl_indian_and_indo_chinese_cuisine_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#BreadHalwaCloseBtn').click();
	return false;
}
