using Toybox.WatchUi;
using Toybox.System;

using MatchConstants;

class GoldenPointConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :GoldenPointConfig_Yes) {
            MatchManager.setGoldenPoint(MatchConstants.GOLDEN_POINT_YES);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeGoldenPointConfigMenu();
        } else if (item.getId() == :GoldenPointConfig_No) {
            MatchManager.setGoldenPoint(MatchConstants.GOLDEN_POINT_NO);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeGoldenPointConfigMenu();
        }
    }

}