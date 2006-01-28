event handling
behaviorPreferencesActions
	"Answer an OrderedCollection containing all behavior
	preferences 
	actions my instances support."
	| result operation |
	result := OrderedCollection new.
	operation := ToggleAction
				label: 'Balloon Help'
				receiver: Preferences
				selector: #togglePreference:
				arguments: #(#balloonHelpEnabled ).
	operation getStateSelector: #balloonHelpEnabled.
	result add: operation.
	operation := ToggleAction
				label: 'Programmer Facilities'
				receiver: self class
				selector: #toggleProgrammerFacilities
				arguments: #().
	operation getStateSelector: #programmerFacilities.
	operation description: 'Turn this on to access (powerful, potentially dangerous) normal Squeak programming facilities'.
	result add: operation.
	^ result