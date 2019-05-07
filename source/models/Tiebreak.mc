class Tiebreak extends Game {

	function initialize(points) {
		Game.initialize(points);
	}
	
	function translateHomeScore() {
		return homeScore;
	}
	
	function translateAwayScore() {
		return awayScore;
	}
	
	function needServerChange() {
		var change = false;
		
		if ((homeScore + awayScore) % 2 != 0) {
			change = true;
		}
	
		return change;
	}
}