class initialization
initialize
	"Set my initial state."
	
	"self initialize"
	
	super initialize.
	SessionRegistry := WeakIdentityKeyDictionary new.
	Preferences 
		needsWork;
		addTextPreference: #modelRepositoryURI
		category: #modeling 
		default: self defaultModelRepositoryURI
		balloonHelp: 'location in which to store CASE models'