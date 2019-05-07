using Toybox.WatchUi;
using Toybox.System;

class SetsConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :SetsConfig_OneSet) {
            MatchManager.setSetsPerMatch(1);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :SetsConfig_ThreeSets) {
            MatchManager.setSetsPerMatch(3);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :SetsConfig_FiveSets) {
            MatchManager.setSetsPerMatch(5);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}