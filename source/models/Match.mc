using Toybox.System;
using Toybox.Time;

class Match {

	var id;

	var matchConfig;
	
	var setsToWin;
	
	var homeScores;
	var awayScores;
	var setsPlayed;
	
	var homeScore;
	var awayScore;
	
	var winner;
	
	var set;

	function initialize(config) {
		id = Time.now().value();
		matchConfig = config;
		winner = null;
		homeScores = new [matchConfig.setsPerMatch];
		awayScores = new [matchConfig.setsPerMatch];
		homeScore = 0;
		awayScore = 0;
		setsPlayed = 0;
		setsToWin = Math.floor(matchConfig.setsPerMatch / 2) + 1;
		set = new Set(config, setsPlayed);
	}
	
	function toDictionary() {
		return {
			"id" => id,
			"matchConfig" => matchConfig.toDictionary(),
			"setsToWin" => setsToWin,
			"homeScores" => homeScores,
			"awayScores" => awayScores,
			"setsPlayed" => setsPlayed,
			"homeScore" => homeScore,
			"awayScore" => awayScore,
			"winner" => winner,
			"set" => set.toDictionary()
			};
	}
	
	function fromDictionary(dictionary) {
	
		matchConfig = new MatchConfiguration();
		matchConfig.fromDictionary(dictionary.get("matchConfig"));
		
		id = dictionary.get("id");
		
		setsToWin = dictionary.get("setsToWin");
	
		homeScores = dictionary.get("homeScores");
		awayScores = dictionary.get("awayScores");
		setsPlayed = dictionary.get("setsPlayed");
	
		homeScore = dictionary.get("homeScore");
		awayScore = dictionary.get("awayScore");
	
		winner = dictionary.get("winner");
		
		set = new Set(matchConfig, setsPlayed);
		set.fromDictionary(dictionary.get("set"));
	}
	
	function score(team) {
		$.matchHasWinner = false;
		
		set.score(team);
		
		matchConfig.startingServer = set.server;
		
		homeScores[setsPlayed] = set.homeScore;
		awayScores[setsPlayed] = set.awayScore;
		
		if ($.setHasWinner) {
			increaseTeamScore(team);
			setsPlayed++;
			set = new Set(matchConfig, setsPlayed);
		}
		
		if (getTeamScore(team) >= setsToWin) {
			winner = team;
			$.matchHasWinner = true;
		}
	}
	
	hidden function increaseTeamScore(team) {
		if (team == MatchConstants.HOME_TEAM) {
			homeScore++;
		} else {
			awayScore++;
		}
	}
	
	hidden function getTeamScore(team) {
		if (team == MatchConstants.HOME_TEAM) {
			return homeScore;
		} else {
			return awayScore;
		}
	}
	
	hidden function getRivalScore(team) {
		if (team == MatchConstants.HOME_TEAM) {
			return awayScore;
		} else {
			return homeScore;
		}
	}
}