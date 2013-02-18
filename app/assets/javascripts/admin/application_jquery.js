function my_remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function truc(msg){
	alert(msg);
}

function my_add_fields(link, association, content_variant, content_option_type) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content_variant.replace(regexp, new_id));
  $(link).parent().before(content_option_type.replace(regexp, new_id));

}