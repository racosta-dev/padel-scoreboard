using Toybox.WatchUi;
using Toybox.Application.Storage;

using ViewManager;
using AppConstants.Properties;

class MatchDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(ViewManager.pauseMenu(), new PauseMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onKey(keyEvent) {
        if (keyEvent.getKey() == 4) {
        	WatchUi.pushView(ViewManager.pauseMenu(), new PauseMenuDelegate(), WatchUi.SLIDE_UP);
        }
        return true;
    }
    
    function onBack() {
    	System.exit();
    }
    
    function onTap(event) {
    	var matchHasWinner;
    	
		var center = $.device.screenHeight / 2;
		if (event.getCoordinates()[0] < center) {
			MatchManager.scoreHome();
		} else {
			MatchManager.scoreAway();
		}
		
		if ($.match != null && $.match.winner != null) {
		    Storage.setValue(Properties.POINT_DETAILS + "_" + $.match.id, $.pointDetails);
			WatchUi.switchToView(ViewManager.resultView(), new ResultDelegate(), WatchUi.SLIDE_UP);
		}
		
		WatchUi.requestUpdate();
		
		return true;
	}

}