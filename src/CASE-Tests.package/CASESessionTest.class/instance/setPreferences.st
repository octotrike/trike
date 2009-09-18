initialization
setPreferences
	"Set modelRepositoryURI preference."
	
	(Preferences preferenceAt: #modelRepositoryURI) preferenceValue: 'sessionTestRepository'