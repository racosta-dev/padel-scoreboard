using Toybox.System;
using Toybox.Attention;
using Toybox.Application;
using Toybox.Application.Storage;

using AppConstants.Properties;
using MatchConstants;

var match = null;
var pointDetails = [];

module MatchManager {

	var matchConfig = new MatchConfiguration();
	var app = Application.getApp();

	function matchAlreadyRunning() {
	
		if ($.match != null) {
			return true;
		} else { 
			var dictionary = Storage.getValue(Properties.CURRENT_MATCH);
			
			if (dictionary != null) {
				var currentMatch = new Match(matchConfig);
				currentMatch.fromDictionary(dictionary);
				$.match = currentMatch;
			}
			
			$.pointDetails = Storage.getValue(Properties.POINT_DETAILS);
			
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
    	
		savePointDetails();
    	
    	return matchHasWinner;
	}
	
	function undoLastPoint() {
		var dictionary = Storage.getValue(Properties.LAST_POINT);
		
		if (dictionary != null) {
			var lastPointMatch = new Match(matchConfig);
			lastPointMatch.fromDictionary(dictionary);
			
			$.match = lastPointMatch;
		}
	}
	
	function startMatch() {
		$.match = new Match(matchConfig);
    	Storage.setValue(Properties.CURRENT_MATCH, $.match.toDictionary());
		savePointDetails();
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
	
	function deletePointsData() {
		Storage.deleteValue(Properties.POINT_DETAILS);
		$.pointDetails = [];
	}
	
	function savePointDetails() {
		if ($.pointDetails == null) {
			$.pointDetails = [];
		}
		
		var dictionary = {
    		"\"length\"" => 0,
    		"\"sets\"" => translateSets(),
    		"\"game\"" => {
    			"\"home\"" => "\"" + $.match.set.game.translateHomeScore() + "\"",
    			"\"away\"" => "\"" + $.match.set.game.translateAwayScore() + "\""
    		}
    	};
		
		$.pointDetails.add(dictionary);
	}
	
	hidden function translateSets() {
    	var array = [];
    	var dictionary = null;
    	
    	if ($.match.homeScores != null && $.match.homeScores.size() > 0
    		&& $.match.awayScores != null && $.match.awayScores.size() > 0) {
	    	for (var i = 0; i < $.match.matchConfig.setsPerMatch; i++) {
	    		if ($.match.homeScores[i] != null && $.match.awayScores[i] != null
	    			&& ($.match.homeScores[i] > 0 || $.match.awayScores[i] > 0)) {
	    			dictionary = {
	    				"\"home\"" => $.match.homeScores[i],
	    				"\"away\"" => $.match.awayScores[i]
	    			};
	    			
	    			array.add(dictionary);
	    		}
	    	}
    	}
    	
    	return array;
    }

}