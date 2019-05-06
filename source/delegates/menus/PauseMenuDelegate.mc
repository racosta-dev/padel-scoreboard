using Toybox.WatchUi;
using Toybox.System;

class PauseMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :Pause_Resume) {
            System.println("item 1");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :Pause_UndoLastPoint) {
            System.println("item 2");
            MatchManager.undoLastPoint();
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :Pause_NewMatch) {
            System.println("item 3");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            WatchUi.pushView(new InitialMenuView(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
        } else if (item.getId() == :Pause_Exit) {
            System.println("exit");
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            System.exit();
        }
    }

}