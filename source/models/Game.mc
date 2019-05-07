using MatchConstants;

class Game {

	var pointsPerGame;
	
	var homeScore;
	var awayScore;
	
	function initialize(points) {
		pointsPerGame = points;
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

		if (score < MatchConstants.SCORE_NAMES.size() - 1) {
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
			"homeScore" => homeScore,
			"awayScore" => awayScore
			};
	}
	
	function fromDictionary(dictionary) {
		homeScore = dictionary.get("homeScore");
		awayScore = dictionary.get("awayScore");
	}
	
	function score(team) {
		$.gameHasWinner = false;
		
		increaseTeamScore(team);
		
		if (getTeamScore(team) >= pointsPerGame
				&& getTeamScore(team) - getRivalScore(team) > 1) {
			$.gameHasWinner = true;
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