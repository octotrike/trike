release
restorePreferences
	"Restore Preferences my tests may have changed."
	
	savedPreferences keysAndValuesDo: [:preferenceSymbol :oldValue | 
		(Preferences perform: preferenceSymbol) = oldValue ifFalse: [
			(Preferences preferenceAt: preferenceSymbol) preferenceValue: oldValue]].