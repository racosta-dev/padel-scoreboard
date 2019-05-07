using Toybox.WatchUi;
using Toybox.System;

class ServerConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :ServerConfig_Home) {
            MatchManager.setStartingServer(MatchConstants.HOME_TEAM);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :ServerConfig_Away) {
            MatchManager.setStartingServer(MatchConstants.AWAY_TEAM);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}