using Toybox.WatchUi;

using ViewManager;

class ResultDelegate extends WatchUi.BehaviorDelegate {

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

}