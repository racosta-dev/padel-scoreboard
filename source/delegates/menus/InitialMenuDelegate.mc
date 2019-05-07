using Toybox.WatchUi;
using Toybox.System;

using ViewManager;

class InitialMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :Initial_StartMatch) {
            MatchManager.startMatch();
            WatchUi.pushView(ViewManager.matchView(), new MatchDelegate(), WatchUi.SLIDE_IMMEDIATE);
            return true;
        } else if (item.getId() == :Initial_ServerConfig) {
            WatchUi.pushView(ViewManager.serverConfigMenu(), new ServerConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_SetsConfig) {
            WatchUi.pushView(ViewManager.setsConfigMenu(), new SetsConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_TiebreakConfig) {
            WatchUi.pushView(ViewManager.tiebreakConfigMenu(), new TiebreakConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_GoldenPointConfig) {
            WatchUi.pushView(ViewManager.goldenPointConfigMenu(), new GoldenPointConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_GamesConfig) {
            WatchUi.pushView(ViewManager.gamesConfigMenu(), new GamesConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_Exit) {
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            System.exit();
        }
    }

}