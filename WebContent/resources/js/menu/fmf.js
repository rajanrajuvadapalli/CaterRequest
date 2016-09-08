var $ = jQuery.noConflict();
function fmf_submit() {
	var form = $('form#fmf');
	var full_menu_items = $("form#fmf input[name=full_menu_items]").val();
	//console.log("full_menu_items= " + full_menu_items);
	
	var summary = $("form#fmf input[name=summary]").val();
	//console.log("summary= " + summary);
	
	var rId = $("form#fmf input[name=rId]").val();
	//console.log("rId= " + rId);
	form.submit();
	//return false;
}