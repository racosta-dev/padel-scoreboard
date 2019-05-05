using Toybox.WatchUi;
using Toybox.System;

class GamesConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
    	System.println("Games button pressed");
        if (item.getId() == :GamesConfig_SixGames) {
            System.println("6 games per set");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :GamesConfig_FourGames) {
            System.println("4 games per set");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :GamesConfig_TwoGames) {
            System.println("2 games per set");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :GamesConfig_Tiebreak) {
            System.println("1 tiebreak per set");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}