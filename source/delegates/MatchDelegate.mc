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
		var center = $.device.screenHeight / 2;
		if (event.getCoordinates()[0] < center) {
			MatchManager.scoreHome();
		} else {
			MatchManager.scoreAway();
		}
		
		return true;
	}

}