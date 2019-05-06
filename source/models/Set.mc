using Toybox.System;

class Set {

	var setConfig;
	
	var homeScore;
	var awayScore;
	
	var server;
	
	var game;

	function initialize(config) {
		setConfig = config;
		homeScore = 0;
		awayScore = 0;
		game = new Game(config);
	}
	
	function toDictionary() {
		return {
			"setConfig" => setConfig.toDictionary(),
			"homeScore" => homeScore,
			"awayScore" => awayScore,
			"game" => game.toDictionary()
			};
	}
	
	function fromDictionary(dictionary) {
	
		setConfig = new MatchConfiguration();
		setConfig.fromDictionary(dictionary.get("setConfig"));
		
		homeScore = dictionary.get("homeScore");
		awayScore = dictionary.get("awayScore");
	
		game = new Game(setConfig);
		game.fromDictionary(dictionary.get("game"));
	}
}