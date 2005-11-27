event handling
editIntendedActionActions: parent
	"Answer an OrderedCollection containing all operations
	my instances support for editing intended actions."
	| result |
	result := OrderedCollection new.
	result
		add: (self addRuleActionNamed: #child);
		add: (self alwaysAllowAction);
		add: (self neverAllowAction).
	^result
		
	