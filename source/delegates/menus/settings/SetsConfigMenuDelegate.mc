using Toybox.WatchUi;
using Toybox.System;

class SetsConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :SetsConfig_OneSet) {
            System.println("one set");
            MatchManager.setSetsPerMatch(1);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :SetsConfig_ThreeSets) {
            System.println("best of three sets");
            MatchManager.setSetsPerMatch(3);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :SetsConfig_FiveSets) {
            System.println("best of five sets");
            MatchManager.setSetsPerMatch(5);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}