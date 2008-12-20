streaming
prepositionFor: childComponent
	"Answer an appropriate preposition for childComponent, as a String with a trailing space."
	
	^(self namespaceOf: childComponent) = #implementation 
		ifTrue: ['of ']
		ifFalse: ['in ']
	