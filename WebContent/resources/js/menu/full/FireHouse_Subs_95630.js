var $ = jQuery.noConflict();
var fire_house_subs_menu_items = [];

function populateFullMenuFirehouseSaladGrilledChickenSelectedItems() {
	var name = "Firehouse Salad(Grilled Chicken)";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FirehouseSaladGrilledChickenCount]').val();
	var spl = $('input[name=FirehouseSaladGrilledChickenSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuItalianwithGrilledChickenSaladSelectedItems() {
	var name = "Italian with Grilled Chicken Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ItalianwithGrilledChickenSaladCount]').val();
	var spl = $('input[name=ItalianwithGrilledChickenSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuHookandLadderSaladSelectedItems() {
	var name = "Hook and Ladder Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=HookandLadderSaladCount]').val();
	var spl = $('input[name=HookandLadderSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMommasHomemadeChickenSaladSelectedItems() {
	var name = "Momma's Homemade Chicken Salad";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MommasHomemadeChickenSaladCount]').val();
	var spl = $('input[name=MommasHomemadeChickenSaladSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuHookandLadderSandwichSelectedItems() {
	var name = "Hook and Ladder Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=HookandLadderSandwichCount]').val();
	var spl = $('input[name=HookandLadderSandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuFirehouseMeatballSandwichSelectedItems() {
	var name = "Firehouse Meatball Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FirehouseMeatballSandwichCount]').val();
	var spl = $('input[name=FirehouseMeatballSandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuNewYorkSteamerSandwichSelectedItems() {
	var name = "New York Steamer Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=NewYorkSteamerSandwichCount]').val();
	var spl = $('input[name=NewYorkSteamerSandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuItalianSandwichSelectedItems() {
	var name = "Italian Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ItalianSandwichCount]').val();
	var spl = $('input[name=ItalianSandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTurkeyBaconRanchSandwichSelectedItems() {
	var name = "Turkey Bacon Ranch Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TurkeyBaconRanchSandwichCount]').val();
	var spl = $('input[name=TurkeyBaconRanchSandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuClubonaSubSelectedItems() {
	var name = "Club on a Sub";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ClubonaSubCount]').val();
	var spl = $('input[name=ClubonaSubSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSteakandCheeseSandwichSelectedItems() {
	var name = "Steak and Cheese Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SteakandCheeseSandwichCount]').val();
	var spl = $('input[name=SteakandCheeseSandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuEngineerSandwichSelectedItems() {
	var name = "Engineer Sandwich";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=EngineerSandwichCount]').val();
	var spl = $('input[name=EngineerSandwichSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuFirehouseHeroSelectedItems() {
	var name = "Firehouse Hero";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=FirehouseHeroCount]').val();
	var spl = $('input[name=FirehouseHeroSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuSrirachaBeefSubSelectedItems() {
	var name = "Sriracha Beef Sub";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SrirachaBeefSubCount]').val();
	var spl = $('input[name=SrirachaBeefSubSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuCaptSorensensDatilPepperGrilledChickenSubSelectedItems() {
	var name = "Capt. Sorensen's Datil Pepper Grilled Chicken Sub";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CaptSorensensDatilPepperGrilledChickenSubCount]').val();
	var spl = $('input[name=CaptSorensensDatilPepperGrilledChickenSubSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuHookandLaddarLightSubSelectedItems() {
	var name = "Hook and Laddar Light Sub";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=HookandLaddarLightSubCount]').val();
	var spl = $('input[name=HookandLaddarLightSubSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTurkeyandCranberrySubSelectedItems() {
	var name = "Turkey and Cranberry Sub";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TurkeyandCranberrySubCount]').val();
	var spl = $('input[name=TurkeyandCranberrySubSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuTurkeySalsaVerdeSubSelectedItems() {
	var name = "Turkey Salsa Verde Sub";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=TurkeySalsaVerdeSubCount]').val();
	var spl = $('input[name=TurkeySalsaVerdeSubSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMommasHomemadeChickenSaladSubSelectedItems() {
	var name = "Momma's Homemade Chicken Salad Sub";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MommasHomemadeChickenSaladSubCount]').val();
	var spl = $('input[name=MommasHomemadeChickenSaladSubSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateFullMenuCookieSelectedItems() {
	var name = "Cookie";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CookieCount]').val();
	var spl = $('input[name=CookieSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBrownieSelectedItems() {
	var name = "Brownie";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BrownieCount]').val();
	var spl = $('input[name=BrownieSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuDoritosnachocheeseSelectedItems() {
	var name = "Doritos nacho cheese ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DoritosnachocheeseCount]').val();
	var spl = $('input[name=DoritosnachocheeseSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuDoritoscoolranchSelectedItems() {
	var name = "Doritos cool ranch ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=DoritoscoolranchCount]').val();
	var spl = $('input[name=DoritoscoolranchSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBakedlaysSelectedItems() {
	var name = "Baked lay's ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BakedlaysCount]').val();
	var spl = $('input[name=BakedlaysSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBakedlaysbarbecueSelectedItems() {
	var name = "Baked lay's barbecue ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BakedlaysbarbecueCount]').val();
	var spl = $('input[name=BakedlaysbarbecueSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuMrsVickiesjalapenoSelectedItems() {
	var name = "Mrs. Vickies jalapeno ";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=MrsVickiesjalapenoCount]').val();
	var spl = $('input[name=MrsVickiesjalapenoSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSunchipsSelectedItems() {
	var name = "Sun chips.";
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SunchipsCount]').val();
	var spl = $('input[name=SunchipsSpl]').val();
	var desc = "Count: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="full-menu-list-item" id="'
			+ div_id
			+ '">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<span class="full-menu-remove-item" onclick="remove_fire_house_subs_item(\''
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +
			+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');
	var data = name + "+" + desc;
	fire_house_subs_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

