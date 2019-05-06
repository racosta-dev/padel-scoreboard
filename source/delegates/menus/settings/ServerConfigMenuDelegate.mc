using Toybox.WatchUi;
using Toybox.System;

class ServerConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :ServerConfig_Home) {
            System.println("home starts serving");
            MatchManager.setStartingServer(MatchConstants.HOME_TEAM);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :ServerConfig_Away) {
            System.println("away starts serving");
            MatchManager.setStartingServer(MatchConstants.AWAY_TEAM);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}