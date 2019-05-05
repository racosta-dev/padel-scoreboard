using Toybox.WatchUi;

class MatchDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.PauseMenu(), new PauseMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() {
        //WatchUi.pushView(new Rez.Menus.InitialMenu(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
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
    	System.println("AAA");
		var center = $.device.screenHeight / 2;
		if (event.getCoordinates()[0] < center) {
			System.println("Home scores");
		} else {
			System.println("Away scores");
		}
		
		return true;
	}

}