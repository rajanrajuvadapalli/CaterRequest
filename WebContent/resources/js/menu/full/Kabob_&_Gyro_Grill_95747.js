var $ = jQuery.noConflict();
var kabob_and_gyro_grill_menu_items = [];

function populateFullMenuGreekSalad1SelectedItems() {
	var name = "Greek Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GreekSalad1Count]').val();
	var spl = $('input[name=GreekSalad1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#GreekSalad1CloseBtn').click();
	return false;
}
function populateFullMenuSteakSaladSelectedItems() {
	var name = "Steak Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SteakSaladCount]').val();
	var spl = $('input[name=SteakSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#SteakSaladCloseBtn').click();
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
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChickenSaladCloseBtn').click();
	return false;
}
function populateFullMenuCombinationSaladSelectedItems() {
	var name = "Combination Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CombinationSaladCount]').val();
	var spl = $('input[name=CombinationSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#CombinationSaladCloseBtn').click();
	return false;
}

function populateFullMenuChickenGyrosSelectedItems() {
	var name = "Chicken Gyros";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenGyrosCount]').val();
	var spl = $('input[name=ChickenGyrosSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChickenGyrosCloseBtn').click();
	return false;
}
function populateFullMenuSteakGyrosSelectedItems() {
	var name = "Steak Gyros";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SteakGyrosCount]').val();
	var spl = $('input[name=SteakGyrosSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#SteakGyrosCloseBtn').click();
	return false;
}
function populateFullMenuMixedGyrosChickenSteakSelectedItems() {
	var name = "Mixed Gyros(Chicken & Steak)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MixedGyrosChickenSteakCount]').val();
	var spl = $('input[name=MixedGyrosChickenSteakSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#MixedGyrosChickenSteakCloseBtn').click();
	return false;
}
function populateFullMenuVeggieGyrosSelectedItems() {
	var name = "Veggie Gyros";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VeggieGyrosCount]').val();
	var spl = $('input[name=VeggieGyrosSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#VeggieGyrosCloseBtn').click();
	return false;
}

function populateFullMenuBeefKabob1SelectedItems() {
	var name = "Beef Kabob";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BeefKabob1Count]').val();
	var spl = $('input[name=BeefKabob1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#BeefKabob1CloseBtn').click();
	return false;
}
function populateFullMenuChickenKabob1SelectedItems() {
	var name = "Chicken Kabob";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenKabob1Count]').val();
	var spl = $('input[name=ChickenKabob1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChickenKabob1CloseBtn').click();
	return false;
}
function populateFullMenuLambKabob1SelectedItems() {
	var name = "Lamb Kabob";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LambKabob1Count]').val();
	var spl = $('input[name=LambKabob1Spl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#LambKabob1CloseBtn').click();
	return false;
}
function populateFullMenuCombinationKabobChickenandLambBeefSelectedItems() {
	var name = "Combination Kabob (Chicken and Lamb/Beef)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CombinationKabobChickenandLambBeefCount]').val();
	var spl = $('input[name=CombinationKabobChickenandLambBeefSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#CombinationKabobChickenandLambBeefCloseBtn').click();
	return false;
}
function populateFullMenuChappaliKabobSelectedItems() {
	var name = "Chappali Kabob";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChappaliKabobCount]').val();
	var spl = $('input[name=ChappaliKabobSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#ChappaliKabobCloseBtn').click();
	return false;
}

function populateFullMenuHummusSelectedItems() {
	var name = "Hummus";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=HummusCount]').val();
	var spl = $('input[name=HummusSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#HummusCloseBtn').click();
	return false;
}
function populateFullMenuFalafelSelectedItems() {
	var name = "Falafel";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FalafelCount]').val();
	var spl = $('input[name=FalafelSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_kabob_and_gyro_grill_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>'
			+ +'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	kabob_and_gyro_grill_menu_items.push(data);
	// console.log(data);
	// $.magnificPopup.close();
	$('button#FalafelCloseBtn').click();
	return false;
}
