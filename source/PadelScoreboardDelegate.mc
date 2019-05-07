using Toybox.WatchUi;
using ViewManager;

class PadelScoreboardDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(ViewManager.initialMenu(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() {
        WatchUi.pushView(ViewManager.initialMenu(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    function onKey(keyEvent) {
        if (keyEvent.getKey() == 4) {
        	WatchUi.pushView(ViewManager.initialMenu(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
        }
        return true;
    }

}