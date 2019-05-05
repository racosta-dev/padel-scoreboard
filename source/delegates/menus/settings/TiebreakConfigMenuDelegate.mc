using Toybox.WatchUi;
using Toybox.System;

class TiebreakConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :TiebreakConfig_Yes) {
            System.println("tiebreak yes");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :TiebreakConfig_No) {
            System.println("tiebreak no");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :TiebreakConfig_ExceptInLastSet) {
            System.println("tiebreak yes, except in last set");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}