class MatchTimes {

	var pointStartTime;
	var gameStartTime;
	var setStartTime;
	var matchStartTime;
	
	function initialize() {
		pointStartTime = 0;
		gameStartTime = 0;
		setStartTime = 0;
		matchStartTime = 0;
	}
	
	function toDictionary() {
		return {
			"pointStartTime" => pointStartTime,
			"gameStartTime" => gameStartTime,
			"setStartTime" => setStartTime,
			"matchStartTime" => matchStartTime
		};
	}
	
	function fromDictionary(dictionary) {
		pointStartTime = dictionary.get("pointStartTime");
		gameStartTime = dictionary.get("gameStartTime");
		setStartTime = dictionary.get("setStartTime");
		matchStartTime = dictionary.get("matchStartTime");
	}

}