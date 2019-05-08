using Toybox.WatchUi;
using Toybox.System;

using ViewManager;

class PauseMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :Pause_Resume) {
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freePauseMenu();
            return true;
        } else if (item.getId() == :Pause_UndoLastPoint) {
            MatchManager.undoLastPoint();
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Pause_NewMatch) {
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freePauseMenu();
            WatchUi.pushView(ViewManager.initialMenu(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        } else if (item.getId() == :Pause_DeletePointsData) {
            WatchUi.pushView(ViewManager.deletePointsMenu(), new DeletePointsMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        } else if (item.getId() == :Pause_SendPointsData) {
            WatchUi.pushView(ViewManager.sendPointsMenu(), new SendPointsMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Pause_ResetAppData) {
            MatchManager.resetAppData();
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freePauseMenu();
            WatchUi.pushView(ViewManager.initialMenu(), new InitialMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        } else if (item.getId() == :Pause_Exit) {
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            System.exit();
            return true;
        }
    }

}