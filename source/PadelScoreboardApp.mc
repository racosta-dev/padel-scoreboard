using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System;

using AppConstants.Properties;
using ViewManager;

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
    	if ($.match != null) {
	    	Storage.setValue(Properties.POINT_DETAILS + "_" + $.match.id, $.pointDetails);
    	}
    	
    	if ($.times != null) {
	    	Storage.setValue(Properties.TIMES, $.times.toDictionary());
    	}
    }

    // Return the initial view of your application here
    function getInitialView() {
    	if (MatchManager.matchAlreadyRunning()) {
    		if ($.match.winner == null) {
        		return [ ViewManager.matchView(), new MatchDelegate() ];
        	} else {
        		return [ ViewManager.resultView(), new MatchDelegate() ];
        	}
    	} else {
        	return [ ViewManager.padelScoreboardView(), new PadelScoreboardDelegate() ];
        }
    }

}
