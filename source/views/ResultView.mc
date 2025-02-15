using Toybox.WatchUi;
using TranslateUtils;

using ViewManager;

class ResultView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.ResultLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	// TODO Not sure about this
    	if ($.match != null && $.match.winner == null) {
    		WatchUi.switchToView(ViewManager.matchView(), new MatchDelegate(), WatchUi.SLIDE_IMMEDIATE);
    	}
    	reloadDrawables();
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        reloadDrawables();
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
    function reloadDrawables() {
    
    	if ($.match != null) {
	    	var drawable = findDrawableById("Result_Winner");
	        if (drawable != null) {
	   			drawable.setText(TranslateUtils.translateTeam($.match.winner));
	        }
	        
	        drawable = findDrawableById("Result_MatchLength");
	        if (drawable != null) {
	   			drawable.setText(FormatUtils.formatDuration($.lastMatchLength));
	        }
        }
    }
    
}
