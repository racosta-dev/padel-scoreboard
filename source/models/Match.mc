using Toybox.System;

class Match {

	var matchConfig;
	
	var setsToWin;
	
	var homeScores;
	var awayScores;
	var setsPlayed;
	
	var homeScore;
	var awayScore;
	
	var server;
	var winner;
	
	var set;

	function initialize(config) {
		System.println(config.toString());
		matchConfig = config;
		winner = null;
		homeScores = new [matchConfig.setsPerMatch];
		awayScores = new [matchConfig.setsPerMatch];
		homeScore = 0;
		awayScore = 0;
		setsPlayed = 0;
		setsToWin = Math.floor(matchConfig.setsPerMatch / 2) + 1;
		set = new Set(config);
	}
	
	function toDictionary() {
		return {
			"matchConfig" => matchConfig.toDictionary(),
			"setsToWin" => setsToWin,
			"homeScores" => homeScores,
			"awayScores" => awayScores,
			"setsPlayed" => setsPlayed,
			"homeScore" => homeScore,
			"awayScore" => awayScore,
			"winner" => winner,
			"server" => server,
			"set" => set.toDictionary()
			};
	}
	
	function fromDictionary(dictionary) {
	
		matchConfig = new MatchConfiguration();
		matchConfig.fromDictionary(dictionary.get("matchConfig"));
		
		setsToWin = dictionary.get("setsToWin");
	
		homeScores = dictionary.get("homeScores");
		awayScores = dictionary.get("awayScores");
		setsPlayed = dictionary.get("setsPlayed");
	
		homeScore = dictionary.get("homeScore");
		awayScore = dictionary.get("awayScore");
	
		winner = dictionary.get("winner");
		server = dictionary.get("server");
		
		set = new Set(matchConfig);
		set.fromDictionary(dictionary.get("set"));
	}
}