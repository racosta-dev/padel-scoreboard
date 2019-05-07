using Toybox.System;
using MatchConstants;

class Set {

	var setConfig;
	
	var homeScore;
	var awayScore;
	
	var server;
	
	var game;
	
	var setsPlayed;

	function initialize(config, setsPlayed) {
		setConfig = config;
		setsPlayed = setsPlayed;
		homeScore = 0;
		awayScore = 0;
		server = config.startingServer;
		if (isTiebreak(setConfig, homeScore, awayScore)) {
			game = new Tiebreak(MatchConstants.POINTS_PER_TIEBREAK);
		} else {
			game = new Game(MatchConstants.POINTS_PER_GAME);
		}
	}
	
	function toDictionary() {
		return {
			"setConfig" => setConfig.toDictionary(),
			"setsPlayed" => setsPlayed,
			"homeScore" => homeScore,
			"awayScore" => awayScore,
			"game" => game.toDictionary()
			};
	}
	
	function fromDictionary(dictionary) {
	
		setConfig = new MatchConfiguration();
		setConfig.fromDictionary(dictionary.get("setConfig"));
		
		setsPlayed = dictionary.get("setsPlayed");
		homeScore = dictionary.get("homeScore");
		awayScore = dictionary.get("awayScore");
	
		if (isTiebreak(setConfig, homeScore, awayScore)) {
			game = new Tiebreak(MatchConstants.POINTS_PER_TIEBREAK);
		} else {
			game = new Game(MatchConstants.POINTS_PER_GAME);
		}
		game.fromDictionary(dictionary.get("game"));
	}
	
	function score(team) {
		$.setHasWinner = false;
		
		game.score(team);
		
		if ($.gameHasWinner) {
			toggleServer();
			
			increaseTeamScore(team);
			
			if ((getTeamScore(team) == setConfig.gamesPerSet && getTeamScore(team) - getRivalScore(team) > 1)
					|| (getTeamScore(team) == setConfig.gamesPerSet + 1)) {
				$.setHasWinner = true;
			} else if (getTeamScore(team) == setConfig.gamesPerSet && getRivalScore(team) == setConfig.gamesPerSet) {
				game = new Tiebreak(MatchConstants.POINTS_PER_TIEBREAK);
			} else {
				game = new Game(MatchConstants.POINTS_PER_GAME);
			}
		} else if (game.needServerChange()) {
			toggleServer();
		}
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
	
	hidden function isTiebreak(setConfig, homeScore, awayScore) {
		return (setConfig.gamesPerSet == 1)
			|| (homeScore == setConfig.gamesPerSet
				&& awayScore == setConfig.gamesPerSet
				&& (setConfig.tiebreak == MatchConstants.TIEBREAK_YES
					|| setConfig.tiebreak == MatchConstants.TIEBREAK_EXCEPT_IN_LAST_SET
					&& setsPlayed < setConfig.setsPerMatch - 1));
	}
}