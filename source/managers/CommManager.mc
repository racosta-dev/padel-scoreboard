using Toybox.Communications;

class CommListener extends Communications.ConnectionListener {
    function initialize() {
        Communications.ConnectionListener.initialize();
    }

    function onComplete() {
        System.println("Transmit Complete");
    }

    function onError() {
        System.println("Transmit Failed");
    }
}

module CommManager {

	function send(message) {
		Communications.transmit(message, null, new CommListener());
	}
}