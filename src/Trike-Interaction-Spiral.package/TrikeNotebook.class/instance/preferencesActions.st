event handling
preferencesActions
	"Answer an OrderedCollection containing all preferences categories  
	that are interesting for me."
	| result |
	result := OrderedCollection new.
	result
		add: (GenericActions
				label: 'appearance'
				receiver: self
				selector: #displayPreferencesActions
				arguments: #());
		add: (GenericActions
				label: 'behavior'
				receiver: self
				selector: #behaviorPreferencesActions
				arguments: #()).
	^ result