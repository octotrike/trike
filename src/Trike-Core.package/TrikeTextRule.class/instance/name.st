accessing
name
	"Answer my name."
	^ (not
		ifTrue: ['NOT ']
		ifFalse: [''])
		, name