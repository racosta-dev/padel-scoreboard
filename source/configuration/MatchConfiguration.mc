using MatchDefaults;

class MatchConfiguration {

	var startingServer;
	var setsPerMatch;
	var tiebreak;
	var goldenPoint;
	var gamesPerSet;
	
	function initialize() {
		startingServer = MatchDefaults.STARTING_SERVER;
		setsPerMatch = MatchDefaults.SETS_PER_MATCH;
		tiebreak = MatchDefaults.TIEBREAK;
		goldenPoint = MatchDefaults.GOLDEN_POINT;
		gamesPerSet = MatchDefaults.GAMES_PER_SET;
	}
	
	function toString() {
		return "{ startingServer: " + TranslateUtils.translateTeam(startingServer) +
				", setsPerMatch: " + setsPerMatch +
				", tiebreak: " + TranslateUtils.translateTiebreak(tiebreak) +
				", goldenPoint: " + TranslateUtils.translateGoldenPoint(goldenPoint) +
				", gamesPerSet: " + gamesPerSet +
				" }"; 
	}

}