using Toybox.WatchUi;
using Toybox.System;

class ServerConfigMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :ServerConfig_Home) {
            System.println("home starts serving");
        } else if (item == :ServerConfig_Away) {
            System.println("away starts serving");
        }
    }

}