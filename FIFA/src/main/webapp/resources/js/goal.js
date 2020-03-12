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
	
	numberClick(1);
})
function numberClick(page){

	var cover = '<div class="col-12" id="tableborder"><table id="insertDate"></table></div>';
	$('.tuple').remove();
	$('.attribute').remove();
	$('#tableborder').remove();
	$('#pagingArea').remove();
	
	$('#lastLine').before(cover);
	$.ajax({
		url:"/goalRecord/goalList?currentPage="+page+""
		,type:"post"
		,dateType:"json"
		,success : function(list){

			var navi = new pageNavigator(10,5,page,list.length);
					
			$(list).each(function(index,item){

				if(index >= navi.getStartRecord() && index < navi.getStartRecord()+10){
					var str = '<tr class="tuple">'
						str += '<th>'+(index+1)+'</th>'; 
						str += '<th>'+item.NAME+'</th>'; 
						str += '<th>'+item.TOTALGOAL+'</th>';
						str += '<th>'+item.TEAMNAME+'</th>';
						str += '</tr>'
							
						$('#insertDate').append(str); 
				}
				
			}) 
			selectTotal(navi.getCurrentPage(),list.length)
			$('body').trigger( "create" );
		}
		,error : function() {
			alert("실패");
		}
	})
	
}
function selectTotal(currentPage,totalRecordsCount){
	var hd = '<tr class="attribute">'
	hd += '<th>순위</th>'
	hd += '<th>이름</th>'
	hd += '<th>통산 골</th>'
	hd += '<th>소속 팀</th>'
	hd += '</tr>'

	$('#insertDate').prepend(hd);

	var navi = new pageNavigator(10,5,currentPage,totalRecordsCount);
	var paging = '<tr><th colspan="4" style="border: none;"><div class="col-12" id="pagingArea">'
	paging += '<a href="javascript:javascript:movePageClick(-1)">◀</a>';
		for(var i = navi.getStartPageGroup() ; i <= navi.getEndPageGroup(); i++){
			if(currentPage == i){
				paging += '<a href="javascript:numberClick('+i+')" value='+i+' style="font-size: larger;" id="thisPage">'+i+'</a>'
			}else{
				paging += '<a href="javascript:numberClick('+i+')">'+i+'</a>'
			}
				
	}
	paging += '<a href="javascript:movePageClick(1)">▶</a>';
	paging += '</div></th></tr>'
	$('#insertDate').append(paging)
	
	$('#selectTotal').css('background-color','#a0a0a0').css('color','white');
	$('#selectSeason').css('background-color','white').css('color','black');
}
function movePageClick(fg){
	if(fg == -1){
		var nextPage = parseInt($('#thisPage').text()) - 1;
		if(nextPage == 0){nextPage = 1}
		numberClick(nextPage);
	}else{
		var nextPage = parseInt($('#thisPage').text()) + 1;
		numberClick(nextPage);
	}
}
	