var pos = 0;
var uName = $("#uName_var").val();
var currSentence = $("#sentence_var").val();
var sentenceArray = [];
var userSentence = "";
var compareSentence = "";
var t = null;
var baseTime = -1;
var words = 0;
var curWPM = 0;
var perMatch = 0;

for (i = 0; i < currSentence.length; i++) {
	sentenceArray[i] = currSentence.charAt(i);
}

$(document).on('keypress', function(evt) {
	
	if(!$('#userModal').hasClass('in') && !$('#signUpModal').hasClass('in') && !$('#adminModal').hasClass('in')) {
		evt = evt || window.event;
		var charCode = evt.keyCode || evt.which;
		var charStr = String.fromCharCode(charCode);
		var count = 0;

		 if (evt.which == 32) {
                evt.preventDefault();
		 }
		
		if(t==null)
			t= new Date();
		// after first key press start timer
		if(baseTime==-1){
			baseTime=0;
			baseTime+= t.getMinutes();
			baseTime*=60;
			baseTime+=t.getSeconds();
		}

		if(pos < currSentence.length-1) {
			console.log(charStr);
			console.log(currSentence.charAt(pos));

			userSentence = userSentence + charStr;
			compareSentence = compareSentence + sentenceArray[pos];

			//Change background colour to green for correct letter, red if incorrect
			if(charStr == currSentence.charAt(pos)){
				document.getElementById("letter"+pos).style.backgroundColor = "#66ef82";
				pos++;
			}
			else {
				document.getElementById("letter"+pos).style.backgroundColor = "#ef6767";
				pos++;
			}
			
			

			if(charStr == " ")
				words++;

			//check accuracy						
			for(x = 0; x < compareSentence.length; x++){
				if(compareSentence.charAt(x) == userSentence.charAt(x)) {
					count++;
				}
			}
			perMatch=((100.00*count)/compareSentence.length);

			//display accuracy
			Accuracy.innerHTML ="<h3>Accuracy: "+perMatch.toPrecision(3)+"%</h3>";
		}
		else {
			//check accuracy						
			for(x = 0; x < compareSentence.length; x++){
				if(compareSentence.charAt(x) == userSentence.charAt(x)) {
					count++;
				}
			}
			perMatch=((100.00*count)/compareSentence.length);

			statsFormAccess = document.forms["stats"];
			statsFormAccess.elements["WPM"].value = curWPM;
			statsFormAccess.elements["Accuracy"].value = perMatch.toPrecision(3);
			
			if (uName != "null") {
				document.getElementById("stats").submit();
			}
			else {
				location.reload();
			}
		}
	}
});

$(document).on('keydown', function(evt){
	
	if(!$('#userModal').hasClass('in') && !$('#signUpModal').hasClass('in') && !$('#adminModal').hasClass('in')){
		evt = evt || window.event;
		var charCode = evt.keyCode || evt.which;

		if (pos > 0) {
			if(charCode == 8 || charCode == 46){
				pos--;
				document.getElementById("letter"+pos).style.backgroundColor = "#ffff00";

				userSentence = userSentence.substring(0, userSentence.length()-1);
				compareSentence = compareSentence.substring(0, compareSentence.length()-1);
			}
		}
		/*
		if(charCode == 32){
			
			if(pos < userSentence.length - 1){
				
				pos++
				document.getElementById("letter"+pos).style.backgroundColor = "#66ef82";
				
			}
			
			return false;
		}*/
	}
});

// updates every second
var wpmInterval = setInterval(WPM, 500);

function WPM() {
	// if no key has been pressed
	if(baseTime==-1)
		return;

	var cT= new Date();
	var curTime= 0;


	curTime+= cT.getMinutes();
	curTime*=60;
	curTime+=cT.getSeconds();
	// some day/ hour overflow
	if(cT.getDay() != t.getDay())
		curTime+=(24*60*60);
	else if(cT.getHours() != t.getHours())
		curTime+=(60*60);
	curTime-=baseTime;

	curWPM= (words*60)/(curTime);

	if (isFinite(curWPM))
		document.getElementById("WPM").innerHTML= "<h3>WPM: "+curWPM.toPrecision(4)+"</h3>";
}