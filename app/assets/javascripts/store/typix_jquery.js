function truc(msg){
	alert(msg);
}
function update_price(elem,id){
	if (jQuery(elem).hasClass('selected')) {return false;}
	jQuery(elem).closest('ul').children('li').children('a.selected').removeClass('selected'); /*unselect previous one*/
	jQuery(elem).attr("class","selected"); /*select the new variant link*/
	new_price = jQuery(elem).parent('li').data('price');
	new_variant = jQuery(elem).parent('li').data('variantid');
	new_value = jQuery(elem).parent('li').data('ovvalue');
	$('#product_price_'+id).fadeOut(200,function() {
		$('#product_price_'+id).text(new_price+'€');/*update price for thumbnail*/
		$('#product_price_'+id).fadeIn(200);});
		$('#size_property').fadeOut(200,function() { /*update size for product detail*/
			$('#size_property').children('strong').text(new_value+' pouces ('+pouce_to_cm(new_value)+' cm)');/*update size*/
			$('#size_property').fadeIn(200);
		});
	$('#price_detail').fadeOut(200,function(){
		$('#price_detail').text(new_price+'€');/*update price for product detail*/
		$('#price_detail').fadeIn(200);
	});
	$('#products_'+id).attr('value',new_variant); /*update hidden field value attribute with variant id*/
	}

function pouce_to_cm(value){
	return Math.floor(value*2.54);
}