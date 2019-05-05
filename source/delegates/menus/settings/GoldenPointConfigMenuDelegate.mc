using Toybox.WatchUi;
using Toybox.System;

class GoldenPointConfigMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId() == :GoldenPointConfig_Yes) {
            System.println("golden point yes");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        } else if (item.getId() == :GoldenPointConfig_No) {
            System.println("golden point no");
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
        }
    }

}