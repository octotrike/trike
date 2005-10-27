event handling
changed: aParameter 
	super triggerEvent: aParameter.
	aParameter = #name
		ifTrue: [self triggerEvent:#rule]