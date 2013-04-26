function my_remove_fields(link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).closest(".fields").hide();
}


function my_add_fields(link, association, content_variant, content_option_type) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
	$(link).parent().before(content_variant.replace(regexp, new_id));
	$(link).parent().before(content_option_type.replace(regexp, new_id));

}

function build_variants_selection(item){
	if (item.variants.length ==0){
		add_variants_id_to_list(item.master.variant.id);
	} 
	else{
		$('.var_box').append('<p> Variante du produit '+item.name+'</p>');
		$('.var_box').append('<select name="reduction[variants]" multiple>');
		$.each(item.variants, function(i,valvar){
			$.each(valvar.option_values, function(i,valov){
			$('.var_box select').append('<option value="'+valvar.id+'">'+valov.presentation+'</option>');
			})
		})
		$('.var_box').append('<div class=".var_box"></div');
	}
}

function add_variants_id_to_list(new_value){
	actual_var = $('#variants_id_list').val();
	
	$('#variants_id_list').val(actual_var + (actual_var ? ',' : '') + new_value);
}

$.fn.objectPickerCustom = function(url){
	$(this).tokenInput(url + "&authenticity_token=" + escape(AUTH_TOKEN), {
		searchDelay          : 600,
		hintText             : strings.type_to_search,
		noResultsText        : strings.no_results,
		searchingText        : strings.searching,
		prePopulateFromInput : true,
 		onAdd				 : function(item){build_variants_selection(item);},
		onDelete: function (item) {
		                    alert("Deleted " + item.name);
		                }
	});
};

