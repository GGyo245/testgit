/**
 * 
 */
$(document).ready(function(){
	$('.navibtn').hover(function(){
		$(this).css('background-color','#a0a0a0').css('color','white')
	},function(index){
		if($(this).attr('id')=="now"){
			
		}else{
			$(this).css('background-color','white').css('color','black')
		}
	});
})