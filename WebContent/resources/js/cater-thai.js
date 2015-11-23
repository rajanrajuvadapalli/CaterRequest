var $ = jQuery.noConflict();
var thai_menu_items = [];
function populateVegeterianSpringRollSelectedItems() {
	var name = "Vegeterian Spring Roll";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=springRollCount]').val();
	var spl = $('input[name=springRollSpl]').val();
	var desc = "Number of spring rolls: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateChickenSataySelectedItems() {
	var name = "Chicken Satay";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=chickenSatayCount]').val();
	var spl = $('input[name=chickenSataySpl]').val();
	var desc = "Number of Chicken Satay: " + n;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFriedCalamariSelectedItems() {
	var name = "Fried Calamari";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=fcount]').val();
	var servingsize = $('input[name=fservingSize]:checked').val();
	var spl = $('input[name=fspl]').val();
	var desc = "Number of Fried Calamari: " + n + ", Tray size: " + servingsize;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateTomYumSoupSelectedItems() {
	var name = "Tom Yum Soup";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=tycount]').val();
	var servingsize = $('input[name=tyservingSize]:checked').val();
	var choiceofmeat = $('input[name=tymeat]:checked').val();
	var spicy = $('input[name=tyspicy]:checked').val();
	var spl = $('input[name=tyspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateTomKhaSoupSelectedItems() {
	var name = "Tom Kha Soup";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=tkcount]').val();
	var servingsize = $('input[name=tkservingSize]:checked').val();
	var choiceofmeat = $('input[name=tkmeat]:checked').val();
	var spicy = $('input[name=tkspicy]:checked').val();
	var spl = $('input[name=tkspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateGreenPapayaSaladSelectedItems() {
	var name = "Green Papaya Salad";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=gpscount]').val();
	var servingsize = $('input[name=gpsservingSize]:checked').val();
	// var choiceofmeat = $('input[name=gpsmeat]:checked').val();
	var spicy = $('input[name=gpsspicy]:checked').val();
	var spl = $('input[name=gpsspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateThaiPadThaiSelectedItems() {
	var name = "Pad Thai";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ptcount]').val();
	var servingsize = $('input[name=ptservingsize]:checked').val();
	var choiceofmeat = $('input[name=ptmeat]:checked').val();
	var spicy = $('input[name=ptspicy]:checked').val();
	var spl = $('input[name=ptspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateDrunkenNoodlesSelectedItems() {
	var name = "Drunken Noodles";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=dncount]').val();
	var servingsize = $('input[name=dnservingsize]:checked').val();
	var choiceofmeat = $('input[name=dnmeat]:checked').val();
	var spicy = $('input[name=dnspicy]:checked').val();
	var spl = $('input[name=dnspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateThaiFriedRiceSelectedItems() {
	var name = "Thai Fried Rice";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=frcount]').val();
	var servingsize = $('input[name=frservingsize]:checked').val();
	var choiceofmeat = $('input[name=frmeat]:checked').val();
	var spicy = $('input[name=frspicy]:checked').val();
	var spl = $('input[name=frspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populatePineappleFriedRiceSelectedItems() {
	var name = "Pineapple Fried Rice";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=pfrcount]').val();
	var servingsize = $('input[name=pfrservingsize]:checked').val();
	var choiceofmeat = $('input[name=pfrmeat]:checked').val();
	var spicy = $('input[name=pfrspicy]:checked').val();
	var spl = $('input[name=pfrspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateBasilFriedRiceSelectedItems() {
	var name = "Basil Fried Rice";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=bfrcount]').val();
	var servingsize = $('input[name=bfrservingsize]:checked').val();
	var choiceofmeat = $('input[name=bfrmeat]:checked').val();
	var spicy = $('input[name=bfrspicy]:checked').val();
	var spl = $('input[name=bfrspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateRedCurrySelectedItems() {
	var name = "Red Curry";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=rccount]').val();
	var servingsize = $('input[name=rcservingsize]:checked').val();
	var choiceofmeat = $('input[name=rcmeat]:checked').val();
	var spicy = $('input[name=rcspicy]:checked').val();
	var spl = $('input[name=rcspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
function populateGreenCurrySelectedItems() {
	var name = "Green Curry";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=gccount]').val();
	var servingsize = $('input[name=gcservingsize]:checked').val();
	var choiceofmeat = $('input[name=gcmeat]:checked').val();
	var spicy = $('input[name=gcspicy]:checked').val();
	var spl = $('input[name=gcspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateYellowCurrySelectedItems() {
	var name = "Yellow Curry";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=yccount]').val();
	var servingsize = $('input[name=ycservingsize]:checked').val();
	var choiceofmeat = $('input[name=ycmeat]:checked').val();
	var spicy = $('input[name=ycspicy]:checked').val();
	var spl = $('input[name=ycspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populatePanangCurrySelectedItems() {
	var name = "Panang Curry";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=pccount]').val();
	var servingsize = $('input[name=pcservingsize]:checked').val();
	var choiceofmeat = $('input[name=pcmeat]:checked').val();
	var spicy = $('input[name=pcspicy]:checked').val();
	var spl = $('input[name=pcspl]').val();
	var desc = "Number of trays: " + n + ", Tray Size: " + servingsize
			+ ", Choice of meat: " + choiceofmeat + ", Spicy: " + spicy;
	if (spl != "")
		desc += ", Special Instructions: " + spl;
	var html = '<div class="list-item" id="'
			+ div_id
			+ '">'
			+ '<div class="left">'
			+ '<h4>'
			+ name
			+ '</h4>'
			+ '<figure>'
			+ desc
			+ '</figure>'
			+ '</div>'
			+ '<span class="thai-item-close remove-item" onclick="remove_thai_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	thai_menu_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}
