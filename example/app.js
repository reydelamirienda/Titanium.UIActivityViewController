

// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'#eeeeee'
});
var label = Ti.UI.createLabel({text: 'Click me!'});
win.add(label);
win.open();

// TODO: write your module tests here
var AVC = require('es.oyatsu.avc');

var activity = AVC.createApplicationActivity({
	type: 'es.oyatsu.custom1',
	title: 'Custom',
	onPerformActivity: function() {
		Ti.API.log("Perform, baby!");
	}
});

var avc = AVC.createActivityViewController({
	text: 'Hiya',
	//excluded: [AVC.ACTIVITY_TYPE_MAIL],
	//applicationActivities: [activity]
});

avc.addEventListener("completed", function(e) {
	Ti.API.log("Completed " + e.activity + " " + e.success);
});

label.addEventListener('click', function() {
	Ti.API.log("Open!");
	avc.open();
});
