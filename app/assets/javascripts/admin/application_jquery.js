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
		var_selector = jQuery('<div/>', { id: item.id})
		var_selector.append('<p> Variante du produit '+item.name+'</p>');
		var_selector.append('<select name="reduction[variants]['+item.id+'][]" multiple>');
		$.each(item.variants, function(i,valvar){
			$.each(valvar.option_values, function(i,valov){
				jQuery('select',var_selector).append('<option value="'+valvar.id+'">'+valov.presentation+'</option>');
			})
		})
		var_selector.appendTo('.var_box').last();

	}
}
function remove_a_variant(item){
	if (item.variants.length ==0){
		actual_var = $('#variants_id_list').val();
		actual_var = actual_var.split(",");
		actual_var = jQuery.grep(actual_var, function(value) {
		  return value != item.master.variant.id;
		});

		$('#variants_id_list').val(actual_var);
	}
	else {
		$('#'+item.id).remove();
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
			remove_a_variant(item);
		}
	});
};

