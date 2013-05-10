function truc(msg){
	alert(msg);
}
function update_price_and_promo(elem,id_prod){
	promo = jQuery(elem).parent('li').data('promo');
	//if promo >0  on fait ci dessous, si pas on cache la case promo
	$('#promo_escu'+id_prod).text("-"+promo+"%");
	$('#promo_escu'+id_prod).css('visibility','visible');
	if (jQuery(elem).hasClass('selected')) {return false;}
	jQuery(elem).closest('ul').children('li').children('a.selected').removeClass('selected'); /*unselect previous one*/
	jQuery(elem).attr("class","selected"); /*select the new variant link*/
	new_price = jQuery(elem).parent('li').data('price');
	new_variant = jQuery(elem).parent('li').data('variantid');
	new_value = jQuery(elem).parent('li').data('ovvalue');
	$('#product_price_'+id_prod).fadeOut(200,function() {
		$('#product_price_'+id_prod).text(new_price+'€');/*update price for thumbnail*/
		$('#product_price_'+id_prod).fadeIn(200);});
		$('#size_property').fadeOut(200,function() { /*update size for product detail*/
			$('#size_property').children('strong').text(new_value+' pouces ('+pouce_to_cm(new_value)+' cm)');/*update size*/
			$('#size_property').fadeIn(200);
		});
	$('#price_detail').fadeOut(200,function(){
		$('#price_detail').text(new_price+'€');/*update price for product detail*/
		$('#price_detail').fadeIn(200);
	});
	$('#products_'+id_prod).attr('value',new_variant); /*update hidden field value attribute with variant id*/
	}

function pouce_to_cm(value){
	return Math.floor(value*2.54);
}