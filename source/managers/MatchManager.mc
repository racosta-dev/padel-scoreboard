using Toybox.System;
using Toybox.Attention;
using Toybox.Application;
using Toybox.Application.Storage;

using TimeManager;
using CommManager;

using AppConstants.Properties;
using MatchConstants;

var match = null;
var pointDetails = {};

var matchHasWinner = false;
var setHasWinner = false;
var gameHasWinner = false;

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
				
				$.pointDetails = Storage.getValue(Properties.POINT_DETAILS + "_" + $.match.id);
				
				dictionary = Storage.getValue(Properties.TIMES);
				
				if (dictionary != null) {
					var currentTimes = new MatchTimes();
					currentTimes.fromDictionary(dictionary);
					$.times = currentTimes;
				}
			}
			
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
    	
    	$.match.score(team);
    	
    	TimeManager.updateTimes();
    	
    	Storage.setValue(Properties.CURRENT_MATCH, $.match.toDictionary());
    	
		//savePointDetails();
		savePointDetails(team);
	}
	
	function undoLastPoint() {
		var dictionary = Storage.getValue(Properties.LAST_POINT);
		
		if (dictionary != null) {
			var lastPointMatch = new Match(matchConfig);
			lastPointMatch.fromDictionary(dictionary);
			
			$.match = lastPointMatch;
			
			Storage.setValue(Properties.CURRENT_MATCH, dictionary);
		}
	}
	
	function startMatch() {
		//savePointDetails();
    	Storage.deleteValue(Properties.LAST_POINT);
    	Storage.deleteValue(Properties.LAST_MATCH_LENGTH);
    	Storage.deleteValue(Properties.TIMES);
		$.match = new Match(matchConfig);
    	Storage.setValue(Properties.CURRENT_MATCH, $.match.toDictionary());
    	initPointDetails();
		//savePointDetails();
		TimeManager.initializeTimes();
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
		Storage.clearValues();
		$.match = null;
		$.pointDetails = {};
	}
	
	function initPointDetails() {
		var details = Storage.getValue(Properties.POINT_DETAILS);
		
    	if (details == null) {
    		details = [];
    	}
    	
    	details.add($.match.id);
    	Storage.setValue(Properties.POINT_DETAILS, details);
	}
	
	function savePointDetailsOLD() {
		if ($.match != null) {
			var pointDetails = Storage.getValue(Properties.POINT_DETAILS + "_" + $.match.id);
			
			if (pointDetails == null) {
				pointDetails = [];
			}
			
			var dictionary = {
	    		"\"length\"" => $.lastPointLength,
	    		"\"sets\"" => translateSets(),
	    		"\"game\"" => {
	    			"\"home\"" => "\"" + $.match.set.game.translateHomeScore() + "\"",
	    			"\"away\"" => "\"" + $.match.set.game.translateAwayScore() + "\""
	    		}
	    	};
			
			pointDetails.add(dictionary);
			
			Storage.setValue(Properties.POINT_DETAILS + "_" + $.match.id, pointDetails);
		}
	}
	
	function savePointDetails(team) {
		if ($.match != null) {
			//var pointDetails = Storage.getValue(Properties.POINT_DETAILS + "_" + $.match.id);
			
			if ($.pointDetails == null) {
				$.pointDetails = {
					"match" => $.match.id,
					"config" => FormatUtils.formatConfigDetails($.match.matchConfig),
					"points" => "" + team,
					"times" => "" + $.lastPointLength
				};
			} else {
				var pointsString = $.pointDetails.get("points");
				pointsString += team;
				$.pointDetails.put("points", pointsString);
				
				var timesString = $.pointDetails.get("times");
				timesString += "|" + $.lastPointLength;
				$.pointDetails.put("times", timesString);
			}
			
			//Storage.setValue(Properties.POINT_DETAILS + "_" + $.match.id, pointDetails);
		}
	}
	
	function sendPointDetails() {
		var fullDetails = {};
		var detailIds = Storage.getValue(Properties.POINT_DETAILS);
		
		if (detailIds != null && detailIds.size() > 0) {
			for (var i = 0; i < detailIds.size(); i++) {
				fullDetails.put(detailIds[i], Storage.getValue(Properties.POINT_DETAILS + "_" + detailIds[i]));
			}
		}
		
        CommManager.send(fullDetails);
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