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
		server = config.startingServer;
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
	
	function score(team) {
		var setHasWinner = false;
		var gameHasWinner = game.score(team);
		
		if (gameHasWinner) {
			toggleServer();
			
			increaseTeamScore(team);
			
			if ((getTeamScore(team) == setConfig.gamesPerSet && getTeamScore(team) - getRivalScore(team) > 1)
					|| (getTeamScore(team) == setConfig.gamesPerSet + 1)) {
				setHasWinner = true;
			} else if (getTeamScore(team) == setConfig.gamesPerSet && getRivalScore(team) == setConfig.gamesPerSet) {
				game = new Tiebreak(setConfig);
			} else {
				game = new Game(setConfig);
			}
		} else if (game.needServerChange()) {
			toggleServer();
		}
		
		return setHasWinner;
	}
	
	hidden function toggleServer() {
		if (server == MatchConstants.HOME_TEAM) {
			server = MatchConstants.AWAY_TEAM;
		} else {
			server = MatchConstants.HOME_TEAM;
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