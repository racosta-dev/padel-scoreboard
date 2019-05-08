using Toybox.WatchUi;
using Toybox.Application.Storage;

using MatchManager;
using AppConstants.Properties;

class SendPointsMenuView extends WatchUi.Menu2 {

	hidden var items;

    function initialize() {
        Menu2.initialize({ :title => WatchUi.loadResource(Rez.Strings.SendPoints_Title) });
        
        loadOptions();
    }
    
    function onShow() {
    	//reloadOptions();
    }
    
    function onUpdate(dc) {
    	//reloadOptions();
    }
    
    function loadOptions() {
    
    	var details = Storage.getValue(Properties.POINT_DETAILS);
    	
    	addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.SendPoints_Resume),
    						 "",
    						 :SendPoints_Resume,
    						 {}));
    	
    	if (details != null && details.size() > 0) {
	    	for (var i = 0; i < details.size(); i++) {	
	    		if ($.match != null && $.match.id != details[i]) {	
		    		addItem(new MenuItem(details[i] + "",
			        					 "",
			        					 details[i],
			        					 {}));
		        }
	    	}
    	}
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
