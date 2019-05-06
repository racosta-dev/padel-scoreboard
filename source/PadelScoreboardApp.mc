using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System;

using AppConstants.Properties;

var device = System.getDeviceSettings();

class PadelScoreboardApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    	Storage.setValue(Properties.POINT_DETAILS, $.pointDetails);
    }

    // Return the initial view of your application here
    function getInitialView() {
    	if (MatchManager.matchAlreadyRunning()) {
        	return [ new MatchView(), new MatchDelegate() ];
    	} else {
        	return [ new PadelScoreboardView(), new PadelScoreboardDelegate() ];
        }
    }

}
