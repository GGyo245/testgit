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
	
	Change(3)
	
});
function Change(fg){
	var newdate = new Date() 
	var yearnow = newdate.getFullYear();
	var year = parseInt($('#selectYear').text());
	var month = parseInt($('#selectMonth').text());
	
	if(fg == 1 || fg ==2){
		var result = 0;
		if(fg == 1){
			year = year - 1;
			$('#selectYear').text(year)
		}else if(fg == 2){
			year = year + 1;
			$('#selectYear').text(year)
		}
		if(yearnow < year){
			alert("지정할 수 없습니다.")
			$('#selectYear').text(yearnow) ;
		}
	}else{
		if(fg == 3){
			month = month - 1;
			if(month == 0){month = 12}
			$('#selectMonth').text(month)
		}else if(fg == 4){
			month = month + 1;
			if(month == 13){month = 1}
			$('#selectMonth').text(month)
		}
	}
	$('.gameboard').remove();
	$.ajax({
		url:"/gameRecord/gameList?year="+year+"&month="+month+""
		,type:"post"
		,dateType:"json"
		,success : function(list){
			if(list.length == 0){
				$('#lastLine').before('<div class=">')
			}
			$(list).each(function(index,item){
				
				var str = '<div class="col-xl-3 col-sm-6 col-12 gameboard">'
				str += '<div class="score">'
				str += '<img src="resources/img/teamlogo/'+item.HOMETEAMNAM+'.png" class="teamLogo" style="margin-right: 5px;">'
				str += '<span style="font-size: x-large;">'+item.HOMETEAMNAM+' '+item.HOMESCORE+':'+item.AWAYSCORE+' '+item.AWAYTEAMNAME+'</span>'
				str += '<img src="resources/img/teamlogo/'+item.AWAYTEAMNAME+'.png" class="teamLogo" style="margin-left: 5px;"><br/>'
				str += '<span style="font-size: small">'+item.GAMEDATE+'</span>'
				str += '</div></div>'

				$('#lastLine').before(str);
			})
			$('body').trigger( "create" );
		}
		,error : function() {
			alert("실패");
		}
	})
}