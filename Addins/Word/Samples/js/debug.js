/* $Id: debug.js,v 1.2 2008-10-02 22:37:49 jmakeig Exp $ */

if(!window.console) {
	window.console = (function() {
		var log = document.createElement("textarea");
		log.id = "ML-Debug-Log";
		log.readOnly = "readOnly";
		return {
			init: function() {
				document.body.appendChild(log);
				log = $(log);
				log.setStyle({
					"position": "fixed",
					"bottom": "2em",
					"left": "0",
					"width": "20em",
					"height": "10em",
				    "z-index": "10"
				});
			},
			log: function(message) {
				log.value = message + "\n" + log.value; 
			}
		}
	})();
}
var _l = window.console.log;
Event.observe(window, "error", function(ex) {
	alert(ex.message);
});

document.observe("dom:loaded", function() {
	window.console.init();
	// Create a "Refresh" button
	var refresh = document.createElement("button");
	refresh.id = "ML-Debug-Refresh";
	refresh.appendChild(document.createTextNode("Refresh"));
	document.body.appendChild(refresh);
	refresh = $(refresh); 
	refresh.setStyle({
		"position": "fixed",
		"bottom": "2em",
		"right": "0",
		"width": "8em",
	    "z-index": "10"
	});
	refresh.observe("click", function(){ 
			window.location.reload();
	});
});