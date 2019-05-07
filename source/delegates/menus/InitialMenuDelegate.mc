using Toybox.WatchUi;
using Toybox.System;

using ViewManager;

class InitialMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :Initial_StartMatch) {
            System.println("start match");
            MatchManager.startMatch();
            WatchUi.pushView(ViewManager.matchView(), new MatchDelegate(), WatchUi.SLIDE_IMMEDIATE);
            return true;
        } else if (item.getId() == :Initial_ServerConfig) {
            System.println("server config");
            WatchUi.pushView(ViewManager.serverConfigMenu(), new ServerConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_SetsConfig) {
            System.println("sets config");
            WatchUi.pushView(ViewManager.setsConfigMenu(), new SetsConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_TiebreakConfig) {
            System.println("tiebreak config");
            WatchUi.pushView(ViewManager.tiebreakConfigMenu(), new TiebreakConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_GoldenPointConfig) {
            System.println("golden point config");
            WatchUi.pushView(ViewManager.goldenPointConfigMenu(), new GoldenPointConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_GamesConfig) {
            System.println("games config");
            WatchUi.pushView(ViewManager.gamesConfigMenu(), new GamesConfigMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        } else if (item.getId() == :Initial_Exit) {
            System.println("exit");
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            System.exit();
        }
    }

}