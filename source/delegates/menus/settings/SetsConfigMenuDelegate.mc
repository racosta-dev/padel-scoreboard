using Toybox.WatchUi;
using Toybox.System;

class SetsConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :SetsConfig_OneSet) {
            System.println("one set");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :SetsConfig_ThreeSets) {
            System.println("best of three sets");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :SetsConfig_FiveSets) {
            System.println("best of five sets");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}