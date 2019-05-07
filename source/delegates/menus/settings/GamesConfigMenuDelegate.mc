using Toybox.WatchUi;
using Toybox.System;

class GamesConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :GamesConfig_SixGames) {
            MatchManager.setGamesPerSet(6);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeGamesConfigMenu();
        } else if (item.getId() == :GamesConfig_FourGames) {
            MatchManager.setGamesPerSet(4);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeGamesConfigMenu();
        } else if (item.getId() == :GamesConfig_TwoGames) {
            MatchManager.setGamesPerSet(2);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeGamesConfigMenu();
        } else if (item.getId() == :GamesConfig_Tiebreak) {
            MatchManager.setGamesPerSet(1);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeGamesConfigMenu();
        }
    }

}