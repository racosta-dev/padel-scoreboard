using Toybox.WatchUi;
using Toybox.System;

using ViewManager;

class DeletePointsMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :DeletePoints_Resume) {
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeDeletePointsMenu();
        } else if (item.getId() == :DeletePoints_All) {
            MatchManager.deleteAllPointsData();
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeDeletePointsMenu();
            //WatchUi.pushView(ViewManager.pauseMenu(), new PauseMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        } else {
        	MatchManager.deletePointsData(item.getId());
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            ViewManager.freeDeletePointsMenu();
            //WatchUi.pushView(ViewManager.pauseMenu(), new PauseMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        }
    }

}