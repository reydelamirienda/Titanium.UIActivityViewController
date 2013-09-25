

// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'#eeeeee'
});
var label = Ti.UI.createLabel({text: 'Click me!'});
win.add(label);
win.open();

// TODO: write your module tests here
var AVC = require('es.oyatsu.avc');

function share() {

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

	var calendar = AVC.createImportToCalendarActivity({
		calendar: Ti.Calendar
	});

	var avc = AVC.createActivityViewController({
		excluded: [AVC.ACTIVITY_TYPE_MAIL],
		applicationActivities: [activity, calendar]
	});

	avc.addEventListener("completed", function(e) {
		Ti.API.log("Completed " + e.activity + " " + e.success);
	});

	Ti.API.log("Open!");
	avc.performWithItems('Hiya!', Ti.Filesystem.getFile(Ti.Filesystem.resourcesDirectory, "images/pedo.jpg"), 'http://www.google.com', {begin: new Date(2014,1,10,9,45), end: new Date(2014,1,10,10,15), title: "Dentist"});
}

label.addEventListener('click', function() {
	if (Ti.Calendar.eventsAuthorization == Ti.Calendar.AUTHORIZATION_AUTHORIZED) {
	    share();
	} else {
	    Ti.Calendar.requestEventsAuthorization(function(e){
            share();
        });
	}
});
