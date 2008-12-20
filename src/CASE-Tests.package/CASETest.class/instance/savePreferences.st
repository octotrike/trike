initialization
savePreferences
	"Save Preferences my tests will change."
	
	savedPreferences := Dictionary new.
	self preferencesToSave do: [:preferenceSymbol |
		savedPreferences at: preferenceSymbol put: (Preferences perform: preferenceSymbol)].
	