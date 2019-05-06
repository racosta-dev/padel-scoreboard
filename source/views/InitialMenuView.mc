using Toybox.WatchUi;
using MatchManager;

class InitialMenuView extends WatchUi.Menu2 {

	hidden var startMatchItem;
	hidden var startingServerItem;
	hidden var setsItem;
	hidden var tiebreakItem;
	hidden var goldenPointItem;
	hidden var gamesItem;
	hidden var exitItem;

    function initialize() {
        Menu2.initialize({ :title => WatchUi.loadResource(Rez.Strings.Initial_Title) });
        
        loadOptions();
    }
    
    function onShow() {
    	reloadOptions();
    }
    
    function onUpdate(dc) {
    	reloadOptions();
    }
    
    function loadOptions() {
    
    	// Start match
        addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.Initial_StartMatch),
        					 "",
        					 :Initial_StartMatch,
        					 {}));
        					 
        // Starting server configuration
        addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.Initial_ServerConfig),
        					 TranslateUtils.translateTeam(MatchManager.matchConfig.startingServer),
        					 :Initial_ServerConfig,
        					 {}));
        					 
        // Sets configuration
        addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.Initial_SetsConfig),
        					 "" + MatchManager.matchConfig.setsPerMatch,
        					 :Initial_SetsConfig,
        					 {}));
        					 
        // Tiebreak configuration
        addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.Initial_TiebreakConfig),
        					 TranslateUtils.translateTiebreak(MatchManager.matchConfig.tiebreak),
        					 :Initial_TiebreakConfig,
        					 {}));
        					 
        // Golden point configuration
        addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.Initial_GoldenPointConfig),
        					 TranslateUtils.translateGoldenPoint(MatchManager.matchConfig.goldenPoint),
        					 :Initial_GoldenPointConfig,
        					 {}));
        					 
        // Games configuration
        addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.Initial_GamesConfig),
        					 "" + MatchManager.matchConfig.gamesPerSet,
        					 :Initial_GamesConfig,
        					 {}));
        					 
        // Exit
        addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.Initial_Exit),
        					 "",
        					 :Initial_Exit,
        					 {}));
    }
    
    function reloadOptions() {
    
    	// Starting server configuration
    	var index = findItemById(:Initial_ServerConfig);
    	if (index != -1) {
        	getItem(index).setSubLabel(TranslateUtils.translateTeam(MatchManager.matchConfig.startingServer));
    	}
    
    	// Sets configuration
    	index = findItemById(:Initial_SetsConfig);
    	if (index != -1) {
	        getItem(index).setSubLabel(TranslateUtils.translateSets(MatchManager.matchConfig.setsPerMatch));
    	}
    
    	// Tiebreak configuration
    	index = findItemById(:Initial_TiebreakConfig);
    	if (index != -1) {
	        getItem(index).setSubLabel(TranslateUtils.translateTiebreak(MatchManager.matchConfig.tiebreak));
    	}
    
    	// Golden point configuration
    	index = findItemById(:Initial_GoldenPointConfig);
    	if (index != -1) {
	        getItem(index).setSubLabel(TranslateUtils.translateGoldenPoint(MatchManager.matchConfig.goldenPoint));
    	}
    
    	// Games configuration
    	index = findItemById(:Initial_GamesConfig);
    	if (index != -1) {
	        getItem(index).setSubLabel(TranslateUtils.translateGames(MatchManager.matchConfig.gamesPerSet));
    	}
        	
    }

}
