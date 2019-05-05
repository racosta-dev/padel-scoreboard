using Toybox.WatchUi;
using Toybox.System;

class SetsConfigMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :SetsConfig_OneSet) {
            System.println("one set");
        } else if (item == :SetsConfig_ThreeSets) {
            System.println("best of three sets");
        } else if (item == :SetsConfig_FiveSets) {
            System.println("best of five sets");
        }
    }

}