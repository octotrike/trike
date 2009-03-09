initialization
setUp
	"Prepare my test fixture."
	
	super setUp.
	self 
		savePreferences;
		setPreferences