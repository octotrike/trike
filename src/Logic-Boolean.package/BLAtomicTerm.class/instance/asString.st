streaming
asString
	^ (not
		ifTrue: ['NOT ']
		ifFalse: ['']), atom asString