using Toybox.System;

var match = null;

module MatchManager {

	var matchConfig = new MatchConfiguration();

	function matchAlreadyRunning() {
	
		// TODO recover match
	
		if (match != null) {
			return true;
		} else { 
			return false;
		}
	}
	
	function scoreHome() {
		System.println("Home team scores");
	}
	
	function scoreAway() {
		System.println("Away team scores");
	}
	
	function undoLastPoint() {
		System.println("Undo last point");
	}
	
	function startMatch() {
		System.println("Starting new match");
		match = new Match(matchConfig);
	}
	
	function setStartingServer(server) {
		matchConfig.startingServer = server;
	}
	
	function setSetsPerMatch(setsPerMatch) {
		matchConfig.setsPerMatch = setsPerMatch;
	}
	
	function setTiebreak(tiebreak) {
		matchConfig.tiebreak = tiebreak;
	}
	
	function setGoldenPoint(goldenPoint) {
		matchConfig.goldenPoint = goldenPoint;
	}
	
	function setGamesPerSet(gamesPerSet) {
		matchConfig.gamesPerSet = gamesPerSet;
	}

}