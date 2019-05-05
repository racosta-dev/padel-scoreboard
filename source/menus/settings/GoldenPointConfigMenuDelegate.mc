using Toybox.WatchUi;
using Toybox.System;

class GoldenPointConfigMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :GoldenPointConfig_Yes) {
            System.println("golden point yes");
        } else if (item == :GoldenPointConfig_No) {
            System.println("golden point no");
        }
    }

}