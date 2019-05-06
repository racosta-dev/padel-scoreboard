using Toybox.WatchUi;

class MatchDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.PauseMenu(), new PauseMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onKey(keyEvent) {
        if (keyEvent.getKey() == 4) {
        	WatchUi.pushView(new Rez.Menus.PauseMenu(), new PauseMenuDelegate(), WatchUi.SLIDE_UP);
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
			matchHasWinner = MatchManager.scoreHome();
		} else {
			matchHasWinner = MatchManager.scoreAway();
		}
		
		if (matchHasWinner) {
			WatchUi.pushView(new ResultView(), new ResultDelegate(), WatchUi.SLIDE_UP);
		}
		
		WatchUi.requestUpdate();
		
		return true;
	}

}