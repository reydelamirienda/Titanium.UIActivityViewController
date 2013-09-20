

// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'#eeeeee'
});
var label = Ti.UI.createLabel({text: 'Click me!'});
win.add(label);
win.open();

// TODO: write your module tests here
var AVC = require('es.oyatsu.avc');

var win2 = Ti.UI.createWindow({
	modal: true,
	backgroundColor:'#ff0000',
	width: 30, height: 30
});

var activity = AVC.createApplicationActivity({
	category: AVC.ACTIVITY_CATEGORY_SHARE,
	type: 'es.oyatsu.custom1',
	title: 'Custom',
	onPerformActivity: function() {
		Ti.API.info("Perform, baby!", arguments.length);
		for (var i=0; i < arguments.length; i++) {
			Ti.API.info(arguments[i], typeof arguments[i]);
		}
		return true;
	}
});

var avc = AVC.createActivityViewController({
	excluded: [AVC.ACTIVITY_TYPE_MAIL],
	applicationActivities: [activity]
});

avc.addEventListener("completed", function(e) {
	Ti.API.log("Completed " + e.activity + " " + e.success);
});

label.addEventListener('click', function() {
	Ti.API.log("Open!");
	avc.performWithItems('Hiya!', Ti.Filesystem.getFile(Ti.Filesystem.resourcesDirectory, "images/pedo.jpg"), 'http://www.google.com', {start: new Date(), end: new Date()}, new Date());
});
