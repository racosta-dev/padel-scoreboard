using Toybox.WatchUi;
using Toybox.System;

class InitialMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :Initial_StartMatch) {
            System.println("start match");
            WatchUi.pushView(new MatchView(), new MatchDelegate(), WatchUi.SLIDE_IMMEDIATE);
            return true;
        } else if (item.getId() == :Initial_ServerConfig) {
            System.println("server config");
            WatchUi.pushView(new Rez.Menus.ServerConfigMenu(), new ServerConfigMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        } else if (item.getId() == :Initial_SetsConfig) {
            System.println("sets config");
            WatchUi.pushView(new Rez.Menus.SetsConfigMenu(), new SetsConfigMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        } else if (item.getId() == :Initial_TiebreakConfig) {
            System.println("tiebreak config");
            WatchUi.pushView(new Rez.Menus.TiebreakConfigMenu(), new TiebreakConfigMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        } else if (item.getId() == :Initial_GoldenPointConfig) {
            System.println("golden point config");
            WatchUi.pushView(new Rez.Menus.GoldenPointConfigMenu(), new GoldenPointConfigMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        } else if (item.getId() == :Initial_GamesConfig) {
            System.println("games config");
            WatchUi.pushView(new Rez.Menus.GamesConfigMenu(), new GamesConfigMenuDelegate(), WatchUi.SLIDE_UP);
            return true;
        } else if (item.getId() == :Initial_Exit) {
            System.println("exit");
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            System.exit();
        }
    }

}