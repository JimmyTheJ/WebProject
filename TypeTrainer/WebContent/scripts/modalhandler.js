function load_modal_signup(){
	console.log("In load signup");
	$("#signup").load("signup_modal.jsp");
}

function load_modal_admin(){
	console.log("In load admin");
	$("#admin").load("admin_modal.jsp");
}

function load_modal_user(){
	console.log("In load user");
	$("#user").load("user_modal.jsp");
}

//This is for admin modal linking
function admin_modal_controller(x){
	switch(x){
		case 1:
				document.getElementById('AddSentence').style.display = 'inline';
		    	document.getElementById('UpdateSentence').style.display = 'none';
		    	document.getElementById('SentenceList').style.display = 'none';
			break;
		case 2:
				document.getElementById('AddSentence').style.display = 'none';
		    	document.getElementById('UpdateSentence').style.display = 'inline';
		    	document.getElementById('SentenceList').style.display = 'none';
			break;
		case 3:
				document.getElementById('AddSentence').style.display = 'none';
		    	document.getElementById('UpdateSentence').style.display = 'none';
		    	document.getElementById('SentenceList').style.display = 'inline';
			break;
		default:
				document.getElementById('AddSentence').style.display = 'none';
		    	document.getElementById('UpdateSentence').style.display = 'none';
		    	document.getElementById('SentenceList').style.display = 'inline';
			break;

	}

}
