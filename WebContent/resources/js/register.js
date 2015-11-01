function populateMenuForRestaurantConsent() {
	$("div[id=consent-menu]").empty();
	var cuisine = this.value;
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
				$("div[id=consent-menu]").append(catElement);
			}
		});
	});

}