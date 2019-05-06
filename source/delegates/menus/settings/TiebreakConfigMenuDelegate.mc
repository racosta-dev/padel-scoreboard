using Toybox.WatchUi;
using Toybox.System;

class TiebreakConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :TiebreakConfig_Yes) {
            System.println("tiebreak yes");
            MatchManager.setTiebreak(MatchConstants.TIEBREAK_YES);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :TiebreakConfig_No) {
            System.println("tiebreak no");
            MatchManager.setTiebreak(MatchConstants.TIEBREAK_NO);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :TiebreakConfig_ExceptInLastSet) {
            System.println("tiebreak yes, except in last set");
            MatchManager.setTiebreak(MatchConstants.TIEBREAK_EXCEPT_IN_LAST_SET);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}