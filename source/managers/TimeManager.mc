using Toybox.System;
using Toybox.Lang;

var lastPointLength = 0;
var lastGameLength = 0;
var lastSetLength = 0;
var lastMatchLength = 0;

var times = new MatchTimes();

module TimeManager {

	function initializeTimes() {
		var currentTime = currentTimeSecs();
		
		$.times = new MatchTimes();
		$.times.pointStartTime = currentTime;
		$.times.gameStartTime = currentTime;
		$.times.setStartTime = currentTime;
		$.times.matchStartTime = currentTime;
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