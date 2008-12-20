initialization
setUp
	"Prepare my test fixture."
	
	super setUp.
	self 
		clearReceivedEvents;
		savePreferences;
		setPreferences