using Toybox.WatchUi;
using TimeManager;

class MatchView extends WatchUi.View {

	hidden var timer;

    function initialize() {
    	timer = new Timer.Timer();
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MatchLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	//reloadDrawables();
    	timer.start(method(:onTimer), 1000, true);
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        reloadDrawables(dc);
        View.onUpdate(dc);
        
        // Server information
        dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_BLACK);
    	if ($.match != null && $.match.set.server == MatchConstants.HOME_TEAM) {
			dc.fillCircle(dc.getWidth() / 2 - 55, dc.getHeight() / 2 - 35, 7);
		} else {
			dc.fillCircle(dc.getWidth() / 2 + 55, dc.getHeight() / 2 - 35, 7);
		}
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    	timer.stop();
    }
    
    function onTimer() {
		WatchUi.requestUpdate();
	}
    
    function reloadDrawables(dc) {
	    var drawable;
    
    	if ($.match != null) {
    	
    		// Result information
	    	drawable = findDrawableById("Match_HomePoints");
	        if (drawable != null) {
	   			drawable.setText($.match.set.game.translateHomeScore() + "");
	        }
	        
	    	drawable = findDrawableById("Match_AwayPoints");
	        if (drawable != null) {
	   			drawable.setText($.match.set.game.translateAwayScore() + "");
	        }
	        
	    	drawable = findDrawableById("Match_HomeGames");
	        if (drawable != null) {
	   			drawable.setText(match.set.homeScore + "");
	        }
	        
	    	drawable = findDrawableById("Match_AwayGames");
	        if (drawable != null) {
	   			drawable.setText(match.set.awayScore + "");
	        }
	        
	    	drawable = findDrawableById("Match_HomeSets");
	        if (drawable != null) {
	   			drawable.setText(match.homeScore + "");
	        }
	        
	    	drawable = findDrawableById("Match_AwaySets");
	        if (drawable != null) {
	   			drawable.setText(match.awayScore + "");
	        }
        
        }
        
        // Time information
    	drawable = findDrawableById("Match_CurrentTimeDescription");
        if (drawable != null) {
   			drawable.setText(TimeManager.getCurrentTimeDescription() + "");
        }
        
    	drawable = findDrawableById("Match_CurrentTime");
        if (drawable != null) {
   			drawable.setText(TimeManager.getCurrentTime() + "");
        }
    }
    
}
