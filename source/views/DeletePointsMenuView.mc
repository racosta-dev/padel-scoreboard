using Toybox.WatchUi;
using Toybox.Application.Storage;

using MatchManager;
using AppConstants.Properties;

class DeletePointsMenuView extends WatchUi.Menu2 {

	hidden var items;

    function initialize() {
        Menu2.initialize({ :title => WatchUi.loadResource(Rez.Strings.DeletePoints_Title) });
        
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
    	
        addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.DeletePoints_Resume),
        					 "",
        					 :DeletePoints_Resume,
        					 {}));
        					 
    	if (details != null && details.size() > 0) {
    	
    		if (details.size() > 1) {
		        addItem(new MenuItem(WatchUi.loadResource(Rez.Strings.DeletePoints_All),
		        					 "(" + details.size() - 1 + ")",
		        					 :DeletePoints_All,
		        					 {}));
	    	
		    	for (var i = 0; i < details.size(); i++) {
					if ($.match.id != details[i]) {	    		
		        		addItem(new MenuItem(details[i] + "",
				        					 "",
				        					 details[i],
				        					 {}));
			        }
		    	}
		    }
    	}
    }
    
}
