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
	
	$('.teams').hover(function(){
		$(this).css('background-color','#a0a0a0').css('color','white')
	},function(index){
		if($(this).attr('id')=="now2"){
			
		}else{
			$(this).css('background-color','white').css('color','black')
		}
	});
	
	$('.teams').click(function(){
		
		$('#now2').css('background-color','white').css('color','black').removeAttr('id');
		$(this).css('background-color','#a0a0a0').css('color','white');
		$(this).attr('id','now2');
		
	});
});
function teamClick(teamName){

	if(teamName.length == 0){
		alert('팀을 선택하세요')
	}else{

		var cover = '<div class="col-12" id="tableborder"><table id="insertDate"></table></div>';
		
		$('.tuple').remove();
		$('.attribute').remove();
		$('#tableborder').remove();
		
		$('#lastLine').before(cover);
		
		$.ajax({
			url:"/teamRecord/playerList?teamName="+teamName+""
			,type:"post"
			,dateType:"json"
			,success : function(list){

				$(list).each(function(index,item){

					var str = '<tr class="tuple">'
					str += '<th>'+item.NAME+'</th>'; 
					str += '<th>'+item.BIRTH+'</th>';
					str += '<th>'+item.DEBUT+'</th>';
					if(item.RETIRE == undefined){
						str += '<th>현역선수</th>';
					}else{
						str += '<th>'+item.RETIRE+'</th>';
					}
					str += '</tr>'
						
					$('#insertDate').append(str);
				})
				selectPlayer()
				$('body').trigger( "create" );
			}
			,error : function() {
				alert("실패");
			}
		})
	}
	
}
function selectPlayer(){
	var hd = '<tr class="attribute">'
	hd += '<th>이름</th>'
	hd += '<th>생년월일</th>'
	hd += '<th>데뷔</th>'
	hd += '<th>은퇴</th>'
	hd += '</tr>'

	$('#insertDate').prepend(hd);

	$('#playerSelect').css('background-color','#a0a0a0').css('color','white');
	$('#teamSelect').css('background-color','white').css('color','black');
}
function teamInfoClick(teamName){
	
	if(teamName.length == 0){
		alert('팀을 선택하세요')
	}else{
		$.ajax({
			url:"/teamRecord/teamInfo?teamName="+teamName+""
			,type:"post"
			,dateType:"json"
			,success: function(teamInfo){
				console.log(teamInfo)
				
				$('.tuple').remove();
				$('.attribute').remove();
				$('#tableborder').remove();
				
				var cover = '<div class="col-12" id="tableborder"><table id="insertDate2"></table></div>';
				$('#lastLine').before(cover);
				
				var str = '<tr>';
				str += '<th id="imgTh">';
				str += '<div class="text-center"><img src="/resources/img/teamlogoBigsize/'+teamInfo.TEAMNAME+'.png" id="teamInfoLogo"></div>'
				
				str += '</th>';
				str += '<th id="teamInfoText">';
				str += '<div class="teamInfoTexts" style="font-size: -webkit-xxx-large;">'+teamInfo.TEAMNAME+'</div>'
				str += '<div class="teamInfoTexts"> 창단일 : '+teamInfo.FOUNDATIONDATE+'</div>'
				str += '<div class="teamInfoTexts"> 역대 승리 수 : '+teamInfo.WIN+'승</div>'
				str += '<div class="teamInfoTexts"> 역대 무승부 수 : '+teamInfo.DRAW+'무</div>'
				str += '<div class="teamInfoTexts"> 역대 패배 수 : '+teamInfo.LOSE+'패</div>'
				str += '<div class="teamInfoTexts"> 소속 선수 수 : '+teamInfo.PLAYERNUM+'</div>'
				str += '</th>';
				str += '</tr>';

				
				$('#insertDate2').append(str);
			}
			,error: function(){alert("실패")}
		})

		$('#teamSelect').css('background-color','#a0a0a0').css('color','white');
		$('#playerSelect').css('background-color','white').css('color','black')
	}
	
}