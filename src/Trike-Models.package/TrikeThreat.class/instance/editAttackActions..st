event handling
editAttackActions: parent 
	"Answer an OrderedCollection containing all operations 
	my instances support for editing attacks."
	| result |
	result := OrderedCollection new.
	result
		add: (self addActionNamed: #child).
	^ result copyWithout: nil