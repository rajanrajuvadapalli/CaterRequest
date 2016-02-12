var $ = jQuery.noConflict();
var sandwich_menu_items = [];
function populateChickenSandwichSelectedItems() {
	var name = "Chicken Sandwich";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=cscount]').val();
	var meat = $("input[name=csmeat]:checked").map(function() {return this.value;}).get().join(",");
	var bread = $('input[name=csbread]:checked').val();
	var cheese = $('input[name=cscheese]:checked').val();
	var veggies = $("input[name=csveggies]:checked").map(function() {return this.value;}).get().join(",");
	var others = $("input[name=csothers]:checked").map(function() {return this.value;}).get().join(",");
	var dressing = $("input[name=csdressing]:checked").map(function() {return this.value;}).get().join(",");
	var extras = $("input[name=csextra]:checked").map(function() {return this.value;}).get().join(",");
	var spl = $('input[name=csspl]').val();
	var desc = "Number of Sandwiches: " + n + ", Meat: " + meat + ", Bread: "
			+ bread + ", Cheese: " + cheese + ", Veggies: " + veggies
			+ ", Others: " + others + ", Dressing: " + dressing + ", Extras: "
			+ extras;
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
			+ '<span class="sandwich-item-close remove-item" onclick="remove_sandwich_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	sandwich_menu_items.push(data);
	//console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateTurkeySandwichSelectedItems() {
	var name = "Turkey Sandwich";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=tscount]').val();
	var meat = $("input[name=tsmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var bread = $('input[name=tsbread]:checked').val();
	var cheese = $('input[name=tscheese]:checked').val();
	var veggies = $("input[name=tsveggies]:checked").map(function() {return this.value;}).get().join(",");
	var others = $("input[name=tsothers]:checked").map(function() {return this.value;}).get().join(",");
	var dressing = $("input[name=tsdressing]:checked").map(function() {return this.value;}).get().join(",");
	var extras = $("input[name=tsextra]:checked").map(function() {return this.value;}).get().join(",");
	var spl = $('input[name=tsspl]').val();
	var desc = "Number of Sandwiches: " + n + ", Meat: " + meat + ", Bread: "
			+ bread + ", Cheese: " + cheese + ", Veggies: " + veggies
			+ ", Others: " + others + ", Dressing: " + dressing + ", Extras: "
			+ extras;
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
			+ '<span class="sandwich-item-close remove-item" onclick="remove_sandwich_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	sandwich_menu_items.push(data);
	//console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateRoastBeefSandwichSelectedItems() {
	var name = "Roast Beef Sandwich";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=rbscount]').val();
	var meat = $("input[name=rbsmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var bread = $('input[name=rbsbread]:checked').val();
	var cheese = $('input[name=rbscheese]:checked').val();
	var veggies = $("input[name=rbsveggies]:checked").map(function() {return this.value;}).get().join(",");
	var others = $("input[name=rbsothers]:checked").map(function() {return this.value;}).get().join(",");
	var dressing = $("input[name=rbsdressing]:checked").map(function() {return this.value;}).get().join(",");
	var extras = $("input[name=rbsextra]:checked").map(function() {return this.value;}).get().join(",");
	var spl = $('input[name=rbsspl]').val();
	var desc = "Number of Sandwiches: " + n + ", Meat: " + meat + ", Bread: "
			+ bread + ", Cheese: " + cheese + ", Veggies: " + veggies
			+ ", Others: " + others + ", Dressing: " + dressing + ", Extras: "
			+ extras;
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
			+ '<span class="sandwich-item-close remove-item" onclick="remove_sandwich_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	sandwich_menu_items.push(data);
	//console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateSalamiSandwichSelectedItems() {
	var name = "Salami Sandwich";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=sscount]').val();
	var meat = $("input[name=ssmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var bread = $('input[name=ssbread]:checked').val();
	var cheese = $('input[name=sscheese]:checked').val();
	var veggies = $("input[name=ssveggies]:checked").map(function() {return this.value;}).get().join(",");
	var others = $("input[name=ssothers]:checked").map(function() {return this.value;}).get().join(",");
	var dressing = $("input[name=ssdressing]:checked").map(function() {return this.value;}).get().join(",");
	var extras = $("input[name=ssextra]:checked").map(function() {return this.value;}).get().join(",");
	var spl = $('input[name=ssspl]').val();
	var desc = "Number of Sandwiches: " + n + ", Meat: " + meat + ", Bread: "
			+ bread + ", Cheese: " + cheese + ", Veggies: " + veggies
			+ ", Others: " + others + ", Dressing: " + dressing + ", Extras: "
			+ extras;
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
			+ '<span class="sandwich-item-close remove-item" onclick="remove_sandwich_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	sandwich_menu_items.push(data);
	//console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateBaconSandwichSelectedItems() {
	var name = "Bacon Sandwich";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=bscount]').val();
	var meat = $("input[name=bsmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var bread = $('input[name=bsbread]:checked').val();
	var cheese = $('input[name=bscheese]:checked').val();
	var veggies = $("input[name=bsveggies]:checked").map(function() {return this.value;}).get().join(",");
	var others = $("input[name=bsothers]:checked").map(function() {return this.value;}).get().join(",");
	var dressing = $("input[name=bsdressing]:checked").map(function() {return this.value;}).get().join(",");
	var extras = $("input[name=bsextra]:checked").map(function() {return this.value;}).get().join(",");
	var spl = $('input[name=bsspl]').val();
	var desc = "Number of Sandwiches: " + n + ", Meat: " + meat + ", Bread: "
			+ bread + ", Cheese: " + cheese + ", Veggies: " + veggies
			+ ", Others: " + others + ", Dressing: " + dressing + ", Extras: "
			+ extras;
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
			+ '<span class="sandwich-item-close remove-item" onclick="remove_sandwich_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	sandwich_menu_items.push(data);
	//console.log(data);
	$.magnificPopup.close();
	return false;
}

function populatePastramiSandwichSelectedItems() {
	var name = "Pastrami Sandwich";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=pscount]').val();
	var meat = $("input[name=psmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var bread = $('input[name=psbread]:checked').val();
	var cheese = $('input[name=pscheese]:checked').val();
	var veggies = $("input[name=psveggies]:checked").map(function() {return this.value;}).get().join(",");
	var others = $("input[name=psothers]:checked").map(function() {return this.value;}).get().join(",");
	var dressing = $("input[name=psdressing]:checked").map(function() {return this.value;}).get().join(",");
	var extras = $("input[name=psextra]:checked").map(function() {return this.value;}).get().join(",");
	var spl = $('input[name=psspl]').val();
	var desc = "Number of Sandwiches: " + n + ", Meat: " + meat + ", Bread: "
			+ bread + ", Cheese: " + cheese + ", Veggies: " + veggies
			+ ", Others: " + others + ", Dressing: " + dressing + ", Extras: "
			+ extras;
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
			+ '<span class="sandwich-item-close remove-item" onclick="remove_sandwich_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	sandwich_menu_items.push(data);
	//console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateHamSandwichSelectedItems() {
	var name = "Ham Sandwich";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=hscount]').val();
	var meat = $("input[name=hsmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var bread = $('input[name=hsbread]:checked').val();
	var cheese = $('input[name=hscheese]:checked').val();
	var veggies = $("input[name=hsveggies]:checked").map(function() {return this.value;}).get().join(",");
	var others = $("input[name=hsothers]:checked").map(function() {return this.value;}).get().join(",");
	var dressing = $("input[name=hsdressing]:checked").map(function() {return this.value;}).get().join(",");
	var extras = $("input[name=hsextra]:checked").map(function() {return this.value;}).get().join(",");
	var spl = $('input[name=hsspl]').val();
	var desc = "Number of Sandwiches: " + n + ", Meat: " + meat + ", Bread: "
			+ bread + ", Cheese: " + cheese + ", Veggies: " + veggies
			+ ", Others: " + others + ", Dressing: " + dressing + ", Extras: "
			+ extras;
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
			+ '<span class="sandwich-item-close remove-item" onclick="remove_sandwich_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	sandwich_menu_items.push(data);
	//console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateTunaSandwichSelectedItems() {
	var name = "Tuna Sandwich";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=tuscount]').val();
	var meat = $("input[name=tusmeat]:checked").map(function() {
		return this.value;
	}).get().join(",");
	var bread = $('input[name=tusbread]:checked').val();
	var cheese = $('input[name=tuscheese]:checked').val();
	var veggies = $("input[name=tusveggies]:checked").map(function() {return this.value;}).get().join(",");
	var others = $("input[name=tusothers]:checked").map(function() {return this.value;}).get().join(",");
	var dressing = $("input[name=tusdressing]:checked").map(function() {return this.value;}).get().join(",");
	var extras = $("input[name=tusextra]:checked").map(function() {return this.value;}).get().join(",");
	var spl = $('input[name=tusspl]').val();
	var desc = "Number of Sandwiches: " + n + ", Meat: " + meat + ", Bread: "
			+ bread + ", Cheese: " + cheese + ", Veggies: " + veggies
			+ ", Others: " + others + ", Dressing: " + dressing + ", Extras: "
			+ extras;
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
			+ '<span class="sandwich-item-close remove-item" onclick="remove_sandwich_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	sandwich_menu_items.push(data);
	//console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateVeggieSandwichSelectedItems() {
	var name = "Veggie Sandwich";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=vscount]').val();
	var bread = $('input[name=vsbread]:checked').val();
	var cheese = $('input[name=vscheese]:checked').val();
	var veggies = $("input[name=vsveggies]:checked").map(function() {return this.value;}).get().join(",");
	var others = $("input[name=vsothers]:checked").map(function() {return this.value;}).get().join(",");
	var dressing = $("input[name=vsdressing]:checked").map(function() {return this.value;}).get().join(",");
	var extras = $("input[name=vsextra]:checked").map(function() {return this.value;}).get().join(",");
	var spl = $('input[name=vsspl]').val();
	var desc = "Number of Sandwiches: " + n + ", Bread: " + bread
			+ ", Cheese: " + cheese + ", Veggies: " + veggies + ", Others: "
			+ others + ", Dressing: " + dressing + ", Extras: " + extras;
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
			+ '<span class="sandwich-item-close remove-item" onclick="remove_sandwich_item(\''
			+ div_id + '\');">X</span><div class="right"></div>' + '</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	sandwich_menu_items.push(data);
	//console.log(data);
	$.magnificPopup.close();
	return false;
}
