using Toybox.WatchUi;
using Toybox.System;

class InitialMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item == :Initial_StartMatch) {
            System.println("start match");
        } else if (item == :Initial_ServerConfig) {
            System.println("server config");
        } else if (item == :Initial_SetsConfig) {
            System.println("sets config");
        } else if (item == :Initial_TiebreakConfig) {
            System.println("tiebreak config");
            WatchUi.pushView(new Rez.Menus.TiebreakConfigMenu(), new TiebreakConfigMenuDelegate(), WatchUi.SLIDE_UP);
        } else if (item == :Initial_GoldenPointConfig) {
            System.println("golden point config");
        } else if (item == :Initial_GamesConfig) {
            System.println("games config");
        } else if (item == :Initial_Exit) {
            System.println("exit");
        }
    }

}