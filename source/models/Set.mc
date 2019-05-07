using Toybox.System;
using MatchConstants;

class Set {

	var setConfig;
	
	var homeScore;
	var awayScore;
	
	var server;
	
	var game;
	
	var setsPlayed;

	function initialize(config, startingServer, sets) {
		setConfig = config;
		setsPlayed = sets;
		homeScore = 0;
		awayScore = 0;
		server = startingServer;
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
			"server" => server,
			"game" => game.toDictionary()
			};
	}
	
	function fromDictionary(dictionary) {
	
		setConfig = new MatchConfiguration();
		setConfig.fromDictionary(dictionary.get("setConfig"));
		
		setsPlayed = dictionary.get("setsPlayed");
		homeScore = dictionary.get("homeScore");
		awayScore = dictionary.get("awayScore");
		server = dictionary.get("server");
	
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
			
			if (teamWonSet(team)) {
				$.setHasWinner = true;
			} else if (isTiebreakNext(setConfig, getTeamScore(team), getRivalScore(team))) {
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
	
	hidden function teamWonSet(team) {
		return (getTeamScore(team) >= setConfig.gamesPerSet
				&& getTeamScore(team) - getRivalScore(team) > 1)
					|| (getTeamScore(team) == setConfig.gamesPerSet + 1
						&& isTiebreak())
					|| (getTeamScore(team) >= setConfig.gamesPerSet
						&& setConfig.gamesPerSet == 1);
	}
	
	hidden function isTiebreak() {
		return false;//game instanceof Tiebreak;
	}
	
	hidden function isTiebreakNext(config, teamScore, rivalScore) {
		return (config.gamesPerSet == 1)
			|| (teamScore == config.gamesPerSet
				&& rivalScore == config.gamesPerSet
				&& (config.tiebreak == MatchConstants.TIEBREAK_YES
					|| config.tiebreak == MatchConstants.TIEBREAK_EXCEPT_IN_LAST_SET
					&& setsPlayed < config.setsPerMatch - 1));
	}
}