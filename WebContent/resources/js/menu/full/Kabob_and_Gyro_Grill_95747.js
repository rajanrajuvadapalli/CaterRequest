var $ = jQuery.noConflict();
var remove_kabob_and_gyro_grill_items = [];
function populateFullMenuLambGryosSelectedItems() {
	var name = "Lamb Gyro";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		console.log(this);
		if ($(this).html().indexOf(name) >= 0) {
			console.log("remove =="+this);
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=lambGyroCount]').val();
	var spl = $('input[name=lambGyroSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

			+'</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenGryosSelectedItems() {
	var name = "Chicken Gyro";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		console.log(this);
		if ($(this).html().indexOf(name) >= 0) {
			console.log("remove =="+this);
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenGyroCount]').val();
	var spl = $('input[name=ChickenGyroSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	//console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuSteakGyrosSelectedItems() {
	var name = "Steak Gyro";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=SteakGyroCount]').val();
	var spl = $('input[name=SteakGyroSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	// console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}


function populateFullMenuCombinationGryosSelectedItems() {
	var name = "Combination Gyro";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		console.log(this);
		if ($(this).html().indexOf(name) >= 0) {
			console.log("remove =="+this);
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=CombinationGyroCount]').val();
	var spl = $('input[name=CombinationGyroSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	//console.log(html);
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}



function populateFullMenuVeggieGryosSelectedItems() {
	var name = "Veggie Gyro";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		console.log(this);
		if ($(this).html().indexOf(name) >= 0) {
			console.log("remove =="+this);
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=VeggieGyroCount]').val();
	var spl = $('input[name=VeggieGyroSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}


//Shawarma
function populateFullMenuLambShawarmaSelectedItems() {
	  var name = "Lamb Shawarma";
	  // If an item is previously selected, remove if before adding the new one.
	  $('.slide').children().each(function() {
	    console.log(this);
	    if ($(this).html().indexOf(name) >= 0) {
	      console.log("remove =="+this);
	      $(this).remove();
	    }
	  });
	  var id = $('.slide').children().length;
	  var div_id = "m_" + id;
	  var n = $('input[name=LambShawarmaCount]').val();
	  var spl = $('input[name=LambShawarmaSpl]').val();
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
			+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

			+'</div>';
	  $(html).appendTo('.slide');

	  var data = name + "+" + desc;
	  remove_kabob_and_gyro_grill_items.push(data);
	  // console.log(data);
	  $.magnificPopup.close();
	  return false;
	}


function populateFullMenuSteakShawarmaSelectedItems() {
  var name = "Steak Shawarma";
  // If an item is previously selected, remove if before adding the new one.
  $('.slide').children().each(function() {
    console.log(this);
    if ($(this).html().indexOf(name) >= 0) {
      console.log("remove =="+this);
      $(this).remove();
    }
  });
  var id = $('.slide').children().length;
  var div_id = "m_" + id;
  var n = $('input[name=SteakShawarmaCount]').val();
  var spl = $('input[name=SteakShawarmaSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
  $(html).appendTo('.slide');

  var data = name + "+" + desc;
  remove_kabob_and_gyro_grill_items.push(data);
  // console.log(data);
  $.magnificPopup.close();
  return false;
}



function populateFullMenuChickenShawarmaSelectedItems() {
  var name = "Chicken Shawarma";
  // If an item is previously selected, remove if before adding the new one.
  $('.slide').children().each(function() {
    console.log(this);
    if ($(this).html().indexOf(name) >= 0) {
      console.log("remove =="+this);
      $(this).remove();
    }
  });
  var id = $('.slide').children().length;
  var div_id = "m_" + id;
  var n = $('input[name=ChickenShawarmaCount]').val();
  var spl = $('input[name=ChickenShawarmaSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
  $(html).appendTo('.slide');

  var data = name + "+" + desc;
  remove_kabob_and_gyro_grill_items.push(data);
  // console.log(data);
  $.magnificPopup.close();
  return false;
}


function populateFullMenuMediterraneanShawarmaSelectedItems() {
  var name = "Mediterranean Shawarma";
  // If an item is previously selected, remove if before adding the new one.
  $('.slide').children().each(function() {
    console.log(this);
    if ($(this).html().indexOf(name) >= 0) {
      console.log("remove =="+this);
      $(this).remove();
    }
  });
  var id = $('.slide').children().length;
  var div_id = "m_" + id;
  var n = $('input[name=MediterraneanShawarmaCount]').val();
  var spl = $('input[name=MediterraneanShawarmaSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
  $(html).appendTo('.slide');

  var data = name + "+" + desc;
  remove_kabob_and_gyro_grill_items.push(data);
  // console.log(data);
  $.magnificPopup.close();
  return false;
}

function populateFullMenuCombinationShawarmaSelectedItems() {
  var name = "Combination Shawarma";
  // If an item is previously selected, remove if before adding the new one.
  $('.slide').children().each(function() {
    console.log(this);
    if ($(this).html().indexOf(name) >= 0) {
      console.log("remove =="+this);
      $(this).remove();
    }
  });
  var id = $('.slide').children().length;
  var div_id = "m_" + id;
  var n = $('input[name=CombinationShawarmaCount]').val();
  var spl = $('input[name=CombinationShawarmaSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
  $(html).appendTo('.slide');

  var data = name + "+" + desc;
  remove_kabob_and_gyro_grill_items.push(data);
  // console.log(data);
  $.magnificPopup.close();
  return false;
}


function populateFullMenuGreekSaladSelectedItems() {
	var name = "Greek Salad";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GreekSaladCount]').val();
	var spl = $('input[name=GreekSaladSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuBeefKabobSelectedItems() {
	var name = "Beef Kabob";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=BeefKabobCount]').val();
	var spl = $('input[name=BeefKabobSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGroundBeefKabobSelectedItems() {
	var name = "Ground Beef Kabob";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GroundBeefKabobCount]').val();
	var spl = $('input[name=GroundBeefKabobSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuChickenKabobSelectedItems() {
	var name = "Chicken Kabob";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=ChickenKabobCount]').val();
	var spl = $('input[name=ChickenKabobSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGroundChickenKabobSelectedItems() {
	var name = "Ground Chicken Kabob";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GroundChickenKabobCount]').val();
	var spl = $('input[name=GroundChickenKabobSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuLambKabobSelectedItems() {
	var name = "Lamb Kabob";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=LambKabobCount]').val();
	var spl = $('input[name=LambKabobSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}

function populateFullMenuGroundLambKabobSelectedItems() {
	var name = "Ground Lamb Kabob";
	// If an item is previously selected, remove if before adding the new one.
	$('.slide').children().each(function() {
		if ($(this).html().indexOf(name) >= 0) {
			$(this).remove();
		}
	});
	var id = $('.slide').children().length;
	var div_id = "m_" + id;
	var n = $('input[name=GroundLambKabobCount]').val();
	var spl = $('input[name=GroundLambKabobSpl]').val();
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
		+ div_id + '\');">X</span>' + '<figure>' + desc + '</figure>' +

		+'</div>';
	$(html).appendTo('.slide');

	var data = name + "+" + desc;
	remove_kabob_and_gyro_grill_items.push(data);
	// console.log(data);
	$.magnificPopup.close();
	return false;
}