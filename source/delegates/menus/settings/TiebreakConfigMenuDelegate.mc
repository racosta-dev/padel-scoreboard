using Toybox.WatchUi;
using Toybox.System;

class TiebreakConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :TiebreakConfig_Yes) {
            MatchManager.setTiebreak(MatchConstants.TIEBREAK_YES);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeTiebreakConfigMenu();
        } else if (item.getId() == :TiebreakConfig_No) {
            MatchManager.setTiebreak(MatchConstants.TIEBREAK_NO);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeTiebreakConfigMenu();
        } else if (item.getId() == :TiebreakConfig_ExceptInLastSet) {
            MatchManager.setTiebreak(MatchConstants.TIEBREAK_EXCEPT_IN_LAST_SET);
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            ViewManager.freeTiebreakConfigMenu();
        }
    }

}