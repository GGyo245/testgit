/**
 * 
 */
$(document).ready(function () {
	$('.navibtn').hover(function(){
		$(this).css('background-color','#a0a0a0').css('color','white')
	},function(index){
		if($(this).attr('id')=="now"){
			
		}else{
			$(this).css('background-color','white').css('color','black')
		}
	});
	teamChange()
});

function teamChange(){

	var team = $('#teamChoice').val();
	$('.tuple').remove();
	
	$.ajax({
		url:"/teamRecord/playerList?teamName="+team+""
		,type:"post"
		,dateType:"json"
		,success : function(list){

			$(list).each(function(index,item){

				var str = '<tr class="tuple" id="'+item.PLAYERNUM+'">'
				str += '<th class="name">'+item.NAME+'</th>'; 
				str += '<th class="birth">'+item.BIRTH+'</th>';
				str += '<th class="debut">'+item.DEBUT+'</th>';
				if(item.RETIRE == undefined){
					str += '<th class="retire">현역선수</th>';
				}else{
					str += '<th class="retire">'+item.RETIRE+'</th>';
				}
				str += '<th class="text-center"><button onclick="updatePlayer('+item.PLAYERNUM+')">수정</button></th>'
				str += '</tr>'
					
				$('#insertDate').append(str);
				
			})
			$('body').trigger( "create" );
		}
		,error : function() {
			alert("실패");
		}
	})
	$('#selectPlayer').css('background-color','#a0a0a0').css('color','white');
	$('#selectGame').css('background-color','white').css('color','black');
	$('#GameTableBorder').css('display','none');
	$('#PlayerTableBorder').css('display','initial');
}

function updatePlayer(pk) {
	
	var popupX = (window.screen.width / 2) - (500 / 2);
	var popupY= (window.screen.height / 2) - (200 / 2);
	
	
	var openWin = window.open("/management/updatePlayer?pk="+pk+"",
			"childForm", "width=500, height=200,left="+ popupX + ", top="+ popupY+",resizable = no, scrollbars = no");
}
function update() {
	
	$.ajax({
		url:"/PlayerRecord/updatePlayer"
		,type:"post"
		,data:$('#updatePlayer').serialize()
		,success:function(){
			alert("수정완료");
			teamChange();
		}
		,error: function(){alert("실패")}
		
	})
	
}
function insertPlayer(){
	var popupX = (window.screen.width / 2) - (500 / 2);
	var popupY= (window.screen.height / 2) - (200 / 2);
	
	
	var openWin = window.open("/management/insertPlayer",
			"childForm", "width=500, height=200,left="+ popupX + ", top="+ popupY+",resizable = no, scrollbars = no");
}
function clickGame(){
	
	$('#selectGame').css('background-color','#a0a0a0').css('color','white');
	$('#selectPlayer').css('background-color','white').css('color','black');
	$('#PlayerTableBorder').css('display','none');
	$('#GameTableBorder').css('display','initial');
}
function insert(){
	
	$.ajax({
		url:"/PlayerRecord/insertPlayer"
		,type:"post"
		,data:$('#insertPlayer').serialize()
		,success:function(){
			alert("등록완료");
			teamChange();
		}
		,error: function(){alert("실패")}
		
	})
}




