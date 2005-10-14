accessing
name
	"Answer my name."
	^ 'Actor is '
		, (not
				ifTrue: ['NOT ']
				ifFalse: ['']) , 'in role ', actor name