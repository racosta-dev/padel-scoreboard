using Toybox.System;
using Toybox.Attention;
using Toybox.Application;

using AppConstants.Properties;
using MatchConstants;

var match = null;

module MatchManager {

	var matchConfig = new MatchConfiguration();
	var app = Application.getApp();

	function matchAlreadyRunning() {
	
		if (match != null) {
			return true;
		} else { 
			match = app.getProperty(Properties.CURRENT_MATCH);
			
			if (match != null) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	function scoreHome() {
		return score(MatchConstants.HOME_TEAM);
	}
	
	function scoreAway() {
		return score(MatchConstants.AWAY_TEAM);
	}
	
	function score(team) {
		if (Attention has :vibrate) {
	    	Attention.vibrate([new Attention.VibeProfile(50, 100)]);
    	}
    	
    	return match.score(team);
		// save current match last point
		// score
		// save current match current point
		
		// match.scoreHome() -> set.scoreHome() -> game.scoreHome()
		// gameEnded, setEnded, matchEnded ?
	}
	
	function undoLastPoint() {
		System.println("Undo last point");
		var dictionary = app.getProperty(Properties.LAST_POINT);
		
		if (dictionary != null) {
			var lastPointMatch = new Match(matchConfig);
			lastPointMatch.fromDictionary(dictionary);
			
			match = lastPointMatch;
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