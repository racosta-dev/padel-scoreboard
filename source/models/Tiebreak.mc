class Tiebreak extends Game {

	function initialize(config) {
		Game.initialize(config);
		pointsPerGame = MatchConstants.POINTS_PER_TIEBREAK;
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