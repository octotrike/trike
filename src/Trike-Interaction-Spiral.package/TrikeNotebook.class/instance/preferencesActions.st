event handling
preferencesActions
	"Answer an OrderedCollection containing all preferences
	categories 
	that are interesting for me."
	| result |
	result := OrderedCollection new.
	result
		add: (GenericActions
				label: 'Appearance'
				receiver: self
				selector: #displayPreferencesActions
				arguments: #());
		
		add: (GenericActions
				label: 'Behavior'
				receiver: self
				selector: #behaviorPreferencesActions
				arguments: #()).
	^ result