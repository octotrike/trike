initialization
setUp
	"Prepare my test fixture."
	
	super setUp.
	self 
		initializeSession;
		initializeSpies;
		initializeListeners;
		savePreferences;
		setPreferences