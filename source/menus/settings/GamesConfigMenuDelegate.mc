using Toybox.WatchUi;
using Toybox.System;

class GamesConfigMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :GamesConfig_SixGames) {
            System.println("6 games per set");
        } else if (item == :GamesConfig_FourGames) {
            System.println("4 games per set");
        } else if (item == :GamesConfig_TwoGames) {
            System.println("2 games per set");
        } else if (item == :GamesConfig_Tiebreak) {
            System.println("1 tiebreak per set");
        }
    }

}