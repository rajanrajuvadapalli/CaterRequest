$('document').ready(function() {
	$("input[id=datetimepicker]").datetimepicker();
	// listCustomerEvents();
	/*
	 * $("td[id=customerDashboardData]") .html( "<div
	 * class=\"sideMenuItemsDetail\">Please select from options to your left.</div>");
	 */
	// validateSelectMenuFormOnSubmit();
	validateMenuFormOnSubmit();
});

/*
 * function listCustomerEvents() { // Make an ajax call and get list of events
 * var element = $("td[id=customerDashboardData]"); element.html("<div
 * class=\"sideMenuItemsDetail\">Fetching data...</div>"); $.ajax({ url :
 * "/cater4party/customer/listEvents", type : "GET", context : document.body,
 * success : function(response) { // console.log(response);
 * element.html(response); }, error : function(xhr, status, error) {
 * element.html("<div class=\"sideMenuItemsDetail\">Status:" + status + ", <br>Error:" +
 * error + "</div>"); } }); }
 */

/*
 * function showCreateEventForm() { var element =
 * $("td[id=customerDashboardData]"); $.ajax({ url :
 * "/cater4party/customer/createEvent", type : "GET", context : document.body,
 * success : function(response) { console.log(response); element.html(response);
 * $("input[id=datetimepicker]").datetimepicker(); $('#state').bfhstates({
 * country : 'US', state : 'CA' }); }, error : function(xhr, status, error) {
 * element.html("<div class=\"sideMenuItemsDetail\">Status:" + status + ", <br>Error:" +
 * error + "</div>"); } }); }
 */
/*
 * function showCuisineOptions(eventId) { console.log(eventId); var cuisines = "<div
 * class=\"sideMenuItemsDetail\">" + "<form method=\"POST\"
 * id=\"select-cuisine-form\"
 * action=\"/cater4party/customer/event/selectRestaurant\">"
 *  + " <input type=\"radio\" name=\"cuisine\" value=\"AMERICAN\"> AMERICAN
 * </input> <br> " + " <input type=\"radio\" name=\"cuisine\" value=\"CHINESE\">
 * CHINESE </input> <br> " + " <input type=\"radio\" name=\"cuisine\"
 * value=\"CONTINENTAL\"> CONTINENTAL </input> <br> " + " <input type=\"radio\"
 * name=\"cuisine\" value=\"CUBAN\"> CUBAN </input> <br> " + " <input
 * type=\"radio\" name=\"cuisine\" value=\"FRENCH\"> FRENCH </input> <br> " + "
 * <input type=\"radio\" name=\"cuisine\" value=\"GREEK\"> GREEK </input> <br> "
 *  + " <input type=\"radio\" name=\"cuisine\" value=\"INDIAN\"> INDIAN </input>
 * <br> "
 *  + " <input type=\"radio\" name=\"cuisine\" value=\"INDONESIAN\"> INDONESIAN
 * </input> <br> " + " <input type=\"radio\" name=\"cuisine\" value=\"ITALIAN\">
 * ITALIAN </input> <br> " + " <input type=\"radio\" name=\"cuisine\"
 * value=\"JAPANESE\"> JAPANESE </input> <br> " + " <input type=\"radio\"
 * name=\"cuisine\" value=\"KOREAN\"> KOREAN </input> <br> " + " <input
 * type=\"radio\" name=\"cuisine\" value=\"LEBANESE\"> LEBANESE </input> <br> " + "
 * <input type=\"radio\" name=\"cuisine\" value=\"MALAYSIAN\"> MALAYSIAN
 * </input> <br> " + " <input type=\"radio\" name=\"cuisine\" value=\"MEXICAN\">
 * MEXICAN </input> <br> " + " <input type=\"radio\" name=\"cuisine\"
 * value=\"RUSSIAN\"> RUSSIAN </input> <br> " + " <input type=\"radio\"
 * name=\"cuisine\" value=\"SINGAPORE\"> SINGAPORE </input> <br> " + " <input
 * type=\"radio\" name=\"cuisine\" value=\"SPANISH\"> SPANISH </input> <br> " + "
 * <input type=\"radio\" name=\"cuisine\" value=\"THAI\"> THAI </input> <br> " + "
 * <input type=\"radio\" name=\"cuisine\" value=\"TIBETAN\"> TIBETAN </input>
 * <br> " + " <input type=\"radio\" name=\"cuisine\" value=\"VIETNAMESE\">
 * VIETNAMESE </input> <br> "
 *  + "<input type=\"hidden\" name=\"eventId\" value=\"" + eventId + "\">" + "<button
 * width=\"50px\" class=\"button\">Next</button>" + "</div>" + "</form>";
 * $("td[id=customerDashboardData]").html(cuisines);
 * validateSelectMenuFormOnSubmit(); }
 */

function validateSelectMenuFormOnSubmit() {
	$("form[id=select-cuisine-form]").validate({
		rules : {
			cuisine : {
				required : true
			}
		},
		messages : {
			cuisine : {
				required : "Please select at least 1 cuisine."
			}
		},
		submitHandler : function(form) {
			form.submit();
		}
	});
}

function validateMenuFormOnSubmit() {
	$("form[id=menu-form]").validate({
		rules : {
			itemName : {
				required : true
			}
		},
		messages : {
			itemName : {
				required : "Please select at least 1 item from the menu."
			}
		},
		submitHandler : function(form) {
			form.submit();
		}
	});
}
