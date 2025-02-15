var padelScoreboardView;
var matchView;
var resultView;

var pauseMenu;
var initialMenu;

var gamesConfigMenu;
var goldenPointConfigMenu;
var serverConfigMenu;
var setsConfigMenu;
var tiebreakConfigMenu;

var deletePointsMenu;
var sendPointsMenu;

module ViewManager {

	function padelScoreboardView() {
		if ($.padelScoreboardView == null) {
			$.padelScoreboardView = new PadelScoreboardView();
		}
		
		return $.padelScoreboardView;
	}
	
	function matchView() {
		if ($.matchView == null) {
			$.matchView = new MatchView();
		}
		
		return $.matchView;
	}
	
	function resultView() {
		if ($.resultView == null) {
			$.resultView = new ResultView();
		}
		
		return $.resultView;
	}
	
	function pauseMenu() {
		if ($.pauseMenu == null) {
			$.pauseMenu = new Rez.Menus.PauseMenu();
		}
		
		return $.pauseMenu;
	}

	function initialMenu() {
		if ($.initialMenu == null) {
			$.initialMenu = new InitialMenuView();
		}
		
		return $.initialMenu;
	}

	function gamesConfigMenu() {
		if ($.gamesConfigMenu == null) {
			$.gamesConfigMenu = new Rez.Menus.GamesConfigMenu();
		}
		
		return $.gamesConfigMenu;
	}

	function goldenPointConfigMenu() {
		if ($.goldenPointConfigMenu == null) {
			$.goldenPointConfigMenu = new Rez.Menus.GoldenPointConfigMenu();
		}
		
		return $.goldenPointConfigMenu;
	}
	
	function serverConfigMenu() {
		if ($.serverConfigMenu == null) {
			$.serverConfigMenu = new Rez.Menus.ServerConfigMenu();
		}
		
		return $.serverConfigMenu;
	}

	function setsConfigMenu() {
		if ($.setsConfigMenu == null) {
			$.setsConfigMenu = new Rez.Menus.SetsConfigMenu();
		}
		
		return $.setsConfigMenu;
	}

	function tiebreakConfigMenu() {
		if ($.tiebreakConfigMenu == null) {
			$.tiebreakConfigMenu = new Rez.Menus.TiebreakConfigMenu();
		}
		
		return $.tiebreakConfigMenu;
	}
	
	function deletePointsMenu() {
		if ($.deletePointsMenu == null) {
			$.deletePointsMenu = new DeletePointsMenuView();
		}
		
		return $.deletePointsMenu;
	}
	
	function sendPointsMenu() {
		if ($.sendPointsMenu == null) {
			$.sendPointsMenu = new SendPointsMenuView();
		}
		
		return $.sendPointsMenu;
	}
	
	function freeInitialMenu() {
		$.initialMenu = null;
	}
	
	function freePauseMenu() {
		$.pauseMenu = null;
	}
	
	function freeGamesConfigMenu() {
		$.gamesConfigMenu = null;
	}
	
	function freeGoldenPointConfigMenu() {
		$.goldenPointConfigMenu = null;
	}
	
	function freeServerConfigMenu() {
		$.serverConfigMenu = null;
	}
	
	function freeSetsConfigMenu() {
		$.setsConfigMenu = null;
	}
	
	function freeTiebreakConfigMenu() {
		$.tiebreakConfigMenu = null;
	}

	function freeDeletePointsMenu() {
		$.deletePointsMenu = null;
	}

	function freeSendPointsMenu() {
		$.sendPointsMenu = null;
	}
}