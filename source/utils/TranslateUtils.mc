using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.WatchUi;

module TranslateUtils {

	function translateTeam(teamId) {
		var text = "";
	
		if (teamId == MatchConstants.HOME_TEAM) {
			text = WatchUi.loadResource(Rez.Strings.ServerConfig_Home);
		} else if (teamId == MatchConstants.AWAY_TEAM) {
			text = WatchUi.loadResource(Rez.Strings.ServerConfig_Away);
		}
		
		return text;
	}
	
	function translateTiebreak(tiebreakId) {
		var text = "";
	
		if (tiebreakId == MatchConstants.TIEBREAK_YES) {
			text = WatchUi.loadResource(Rez.Strings.TiebreakConfig_Yes);
		} else if (tiebreakId == MatchConstants.TIEBREAK_NO) {
			text = WatchUi.loadResource(Rez.Strings.TiebreakConfig_No);
		} else if (tiebreakId == MatchConstants.TIEBREAK_EXCEPT_IN_LAST_SET) {
			text = WatchUi.loadResource(Rez.Strings.TiebreakConfig_Yes) + ". " +
				   WatchUi.loadResource(Rez.Strings.TiebreakConfig_ExceptInLastSet);
		}
		
		return text;
	}
	
	function translateGoldenPoint(goldenPointId) {
		var text = "";
	
		if (goldenPointId) {
			text = WatchUi.loadResource(Rez.Strings.GoldenPointConfig_Yes);
		} else {
			text = WatchUi.loadResource(Rez.Strings.GoldenPointConfig_No);
		}
		
		return text;
	}
	
	function translateGames(gamesId) {
		var text = "";
	
		if (gamesId == 1) {
			text = WatchUi.loadResource(Rez.Strings.GamesConfig_Tiebreak);
		} else {
			text = gamesId + "";
		}
		
		return text;
	}
	
	function translateSets(setsId) {
		var text = "";
	
		text = setsId + "";
		
		return text;
	}

}