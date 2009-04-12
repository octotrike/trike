streaming
prepositionFor: childComponent
	"Answer an appropriate preposition for childComponent, as a String with a trailing space."
	
	^(self implementations includes: childComponent) 
		ifTrue: ['of ']
		ifFalse: ['in ']
	