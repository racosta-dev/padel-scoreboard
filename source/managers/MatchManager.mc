using Toybox.System;
using Toybox.Attention;
using Toybox.Application;

using AppConstants.Properties;

var match = null;

module MatchManager {

	var matchConfig = new MatchConfiguration();
	var app = Application.getApp();

	function matchAlreadyRunning() {
	
		$.match = app.getProperty(Properties.CURRENT_MATCH);
	
		if ($.match != null) {
			return true;
		} else { 
			return false;
		}
	}
	
	function scoreHome() {
		
		if (Attention has :vibrate) {
	    	Attention.vibrate([new Attention.VibeProfile(50, 100)]);
    	}
    	
		System.println("Home team scores");
		
		// save current match last point
		// score
		// save current match current point
		
		// match.scoreHome() -> set.scoreHome() -> game.scoreHome()
		// gameEnded, setEnded, matchEnded ?
	}
	
	function scoreAway() {
		System.println("Away team scores");
	}
	
	function undoLastPoint() {
		System.println("Undo last point");
		var dictionary = app.getProperty(Properties.LAST_POINT);
		
		if (dictionary != null) {
			var lastPointMatch = new Match(matchConfig);
			lastPointMatch.fromDictionary(dictionary);
			
			$.match = lastPointMatch;
		}
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