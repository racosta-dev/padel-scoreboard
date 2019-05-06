using Toybox.WatchUi;
using Toybox.System;

class PauseMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :Pause_Resume) {
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :Pause_UndoLastPoint) {
            MatchManager.undoLastPoint();
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :Pause_NewMatch) {
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            WatchUi.pushView(new InitialMenuView(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
        } else if (item.getId() == :Pause_DeletePointsData) {
            MatchManager.deletePointsData();
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            WatchUi.pushView(new InitialMenuView(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
        } else if (item.getId() == :Pause_Exit) {
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            System.exit();
        }
    }

}