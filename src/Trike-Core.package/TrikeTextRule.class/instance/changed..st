event handling
changed: aParameter 
	super changed: aParameter.
	aParameter = #name
		ifTrue: [self changed:#rule]