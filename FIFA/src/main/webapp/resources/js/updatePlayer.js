/**
 * 
 */
$(document).ready(function(){
	var pk = parseInt(window.location.search.substring(4));
	var playerInfo = opener.document.getElementById(pk);
	var name = $(playerInfo).children()[0].textContent;
	
	document.getElementById('name').value = name;

 	document.getElementById('birth').value = $(playerInfo).children()[1].textContent;
	document.getElementById('debut').value = $(playerInfo).children()[2].textContent;
	document.getElementById('retire').value = $(playerInfo).children()[3].textContent;
	document.getElementById('pk').value = pk; 
	
})
function sendDate(){
	
	opener.document.getElementById("name").value = $('#name').val();
	opener.document.getElementById("birth").value = $('#birth').val();
	opener.document.getElementById("debut").value =  $('#debut').val();
	opener.document.getElementById("retire").value = $('#retire').val();
	opener.document.getElementById("pk").value = $('#pk').val();

	opener.update();

	window.close();
}