using Toybox.System;
using MatchConstants;

class Game {

	var gameConfig;
	
	var homeScore;
	var awayScore;

	function initialize(config) {
		gameConfig = config;
		homeScore = 0;
		awayScore = 0;
	}
	
	function translateHomeScore() {
		return translateScore(homeScore, awayScore);
	}
	
	function translateAwayScore() {
		return translateScore(awayScore, homeScore);
	}
	
	private function translateScore(score, rivalScore) {
	
		var scoreName = "";

		if (score < MatchConstants.SCORE_NAMES.size()) {
			scoreName += MatchConstants.SCORE_NAMES[score];
		} else {
			if (score > rivalScore) {
				scoreName += MatchConstants.SCORE_NAMES[4];
			} else {
				scoreName += MatchConstants.SCORE_NAMES[3];
			}
		}

		return scoreName;
	}
	
	function needServerChange() {
		return false;
	}
	
	function toDictionary() {
		return {
			"gameConfig" => gameConfig.toDictionary(),
			"homeScore" => homeScore,
			"awayScore" => awayScore
			};
	}
	
	function fromDictionary(dictionary) {
	
		gameConfig = new MatchConfiguration();
		gameConfig.fromDictionary(dictionary.get("gameConfig"));
		
		homeScore = dictionary.get("homeScore");
		awayScore = dictionary.get("awayScore");
	}
}