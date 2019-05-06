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
	
	function toDictionary() {
		return {
			"startingServer" => startingServer,
			"setsPerMatch" => setsPerMatch,
			"tiebreak" => tiebreak,
			"goldenPoint" => goldenPoint,
			"gamesPerSet" => gamesPerSet
			};
	}
	
	function fromDictionary(dictionary) {
		startingServer = dictionary.get("startingServer");
		setsPerMatch = dictionary.get("setsPerMatch");
		tiebreak = dictionary.get("tiebreak");
		goldenPoint = dictionary.get("goldenPoint");
		gamesPerSet = dictionary.get("gamesPerSet");
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