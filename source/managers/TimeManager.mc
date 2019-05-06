using Toybox.System;

module TimeManager {

	function getCurrentTime() {
		var currentTime = System.getClockTime();
		return currentTime.hour.format("%02d") + ":" + currentTime.min.format("%02d");
	}
	
	function getCurrentTimeDescription() {
		return "";
	}
}