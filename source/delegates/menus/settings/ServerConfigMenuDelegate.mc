using Toybox.WatchUi;
using Toybox.System;

class ServerConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :ServerConfig_Home) {
            System.println("home starts serving");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :ServerConfig_Away) {
            System.println("away starts serving");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}