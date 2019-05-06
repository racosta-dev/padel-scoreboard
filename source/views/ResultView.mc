using Toybox.WatchUi;
using TranslateUtils;

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
    	var drawable = findDrawableById("Result_Winner");
        if (drawable != null) {
   			drawable.setText(TranslateUtils.translateTeam($.match.winner));
        }
    }
    
}
