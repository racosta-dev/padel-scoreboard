using Toybox.WatchUi;
using Toybox.System;

class TiebreakConfigMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :TiebreakConfig_Yes) {
            System.println("tiebreak yes");
        } else if (item == :TiebreakConfig_No) {
            System.println("tiebreak no");
        } else if (item == :TiebreakConfig_ExceptInLastSet) {
            System.println("tiebreak yes, except in last set");
        }
    }

}