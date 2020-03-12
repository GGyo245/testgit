/**
 * 
 */
$(document).ready(function(){
	document.getElementById('team').value = opener.document.getElementById('teamChoice').value;
})
function sendDate(){
	
	opener.document.getElementById("nameNew").value = $('#name').val();
	opener.document.getElementById("teamNew").value = $('#team').val();
	opener.document.getElementById("birthNew").value = $('#birth').val();
	opener.document.getElementById("debutNew").value =  $('#debut').val();
	opener.document.getElementById("retireNew").value = $('#retire').val();

	opener.insert();

	window.close();
}