using Toybox.WatchUi;
using Toybox.System;

using ViewManager;

class SendPointsMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :SendPoints_Resume) {
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeDeletePointsMenu();
        } else {
        	MatchManager.sendPointsData(item.getId());
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            ViewManager.freeDeletePointsMenu();
            WatchUi.pushView(ViewManager.pauseMenu(), new PauseMenuDelegate(), WatchUi.SLIDE_UP);
        }
    }

}