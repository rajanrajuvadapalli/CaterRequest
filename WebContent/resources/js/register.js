function populateMenuForRestaurantConsent() {
	$("div[id=consent-menu]").empty();
	$("button[name=register-button]").prop('disabled', true);
	var cuisine = this.value;
	if(cuisine != "") {
		var contextPath = $('input[id=contextpath]').val();
		var url = contextPath + "/rest/menu/" + cuisine;
		$.getJSON(url, function(data) {
			$.each(data.categories, function(i, cat) {
				if (cat.items.length > 0) {
					var catElement = "<div class=\"col-sm-12\"><b>" + cat.name
							+ "</b>";
					catElement += "<ol>";
					$.each(cat.items, function(i, item) {
						catElement += "<li>" + item.name + "</li>";
					});
					catElement += "</ol>";
					catElement += "</div>";
					$("div[id=consent-menu]").append(catElement);
				}
			});
			var checkbox = "<div class=\"col-sm-12\"><br /> <br /> ";
			checkbox += "<input type=\"checkbox\" name=\"menuconsent\" value=\"yes\"> I accept the menu.";
			checkbox += "<br /> <br /></div>";
			$("div[id=consent-menu]").append(checkbox);
		});
	}
}

