using Toybox.WatchUi;
using Toybox.System;

class GoldenPointConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :GoldenPointConfig_Yes) {
            MatchManager.setGoldenPoint(true);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :GoldenPointConfig_No) {
            MatchManager.setGoldenPoint(false);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}