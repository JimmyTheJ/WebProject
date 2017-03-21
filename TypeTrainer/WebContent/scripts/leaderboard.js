function updateLeaderboard() {
	console.log("LIMIT LEADERBOARD ROWS");
	
	var input, filter, table, tr, td, i;
	input = document.getElementById("leaderboard_num_entries");
	filter = $("#leaderboard_num_entries option:selected").val();
	
	console.log(filter);
	table = document.getElementById("leaderboard-table");
	tr = table.getElementsByTagName("tr");
	
	// Loop through all table rows, and hide those who don't match the search query
	for (i = 0; i < tr.length; i++) {
		if (i > filter) {
			tr[i].style.display = "none";
		}
		else {
			tr[i].style.display = "";
		}
	}	
}

$(document).ready(function() {
	$(window).load(function() {
		updateLeaderboard();
    });
	
	$('#leaderboard_num_entries').change(function() {
		updateLeaderboard();
    });
});