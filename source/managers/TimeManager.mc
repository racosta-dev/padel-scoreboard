using Toybox.System;
using Toybox.Lang;
using Toybox.Application.Storage;

using AppConstants.Properties;

var lastPointLength = 0;
var lastGameLength = 0;
var lastSetLength = 0;
var lastMatchLength = 0;

var times = new MatchTimes();

module TimeManager {

	function init() {
		$.lastMatchLength = Storage.getValue(Properties.LAST_MATCH_LENGTH);
	}

	function initializeTimes() {
		var currentTime = currentTimeSecs();
		
		$.times = new MatchTimes();
		$.times.pointStartTime = currentTime;
		$.times.gameStartTime = currentTime;
		$.times.setStartTime = currentTime;
		$.times.matchStartTime = currentTime;

		$.lastPointLength = 0;
		$.lastGameLength = 0;
		$.lastSetLength = 0;
		$.lastMatchLength = 0;
	}

	function updateTimes() {
		var currentTime = currentTimeSecs();
		
		$.lastPointLength = currentTime - $.times.pointStartTime;
		$.times.pointStartTime = currentTime;
	
		if ($.gameHasWinner) {
			$.lastGameLength = currentTime - $.times.gameStartTime;
			$.times.gameStartTime = currentTime;
		}
		
		if ($.setHasWinner) {
			$.lastSetLength = currentTime - $.times.setStartTime;
			$.times.setStartTime = currentTime;
		}
		
		if ($.matchHasWinner) {
			$.lastMatchLength = currentTime - $.times.matchStartTime;
			$.times.matchStartTime = currentTime;
			Storage.setValue(Properties.LAST_MATCH_LENGTH, $.lastMatchLength);
		}
	}

	function currentTimeSecs() {
		var currentTime = System.getClockTime();
		
		return currentTime.sec + currentTime.min * 60 + currentTime.hour * 3600;
	}

	function getCurrentTime() {
		var currentTime = System.getClockTime();
		return Lang.format("$1$:$2$", [currentTime.hour.format("%02d"),
			   currentTime.min.format("%02d")]);
	}
	
	function getCurrentTimeDescription() {
		return "";
	}
	
}