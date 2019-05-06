using Toybox.WatchUi;

class PadelScoreboardDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new InitialMenuView(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() {
        WatchUi.pushView(new InitialMenuView(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    function onKey(keyEvent) {
        if (keyEvent.getKey() == 4) {
        	WatchUi.pushView(new InitialMenuView(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
        }
        return true;
    }

}