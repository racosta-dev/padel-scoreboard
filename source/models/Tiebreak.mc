using Toybox.System;

class Tiebreak extends Game {

	function initialize(config) {
		Game.initialize(config);
	}
	
	function translateHomeScore() {
		return homeScore;
	}
	
	function translateAwayScore() {
		return awayScore;
	}
	
	function needServerChange() {
	
		var change = false;
		
		if ((homeScore + homeScore) % 2 != 0) {
			change = true;
		}
	
		return change;
	}
}