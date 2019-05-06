using Toybox.System;
using Toybox.Attention;
using Toybox.Application;
using Toybox.Application.Storage;

using AppConstants.Properties;
using MatchConstants;

var match = null;

module MatchManager {

	var matchConfig = new MatchConfiguration();
	var app = Application.getApp();

	function matchAlreadyRunning() {
	
		if ($.match != null) {
			return true;
		} else { 
			var dictionary = Storage.getValue(Properties.CURRENT_MATCH);
			
			var currentMatch = new Match(matchConfig);
			currentMatch.fromDictionary(dictionary);
			
			$.match = currentMatch;
			
			if ($.match != null) {
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
    	
    	Storage.setValue(Properties.LAST_POINT, $.match.toDictionary());
    	
    	var matchHasWinner = $.match.score(team);
    	
    	Storage.setValue(Properties.CURRENT_MATCH, $.match.toDictionary());
    	
    	return matchHasWinner;
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