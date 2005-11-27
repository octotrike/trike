event handling
editIntendedActionActions: parent
	"Answer an OrderedCollection containing all operations
	my instances support for editing intended actions."
	| result |
	result := OrderedCollection new.
	result
		add: (parent addRuleActionNamed: #sibling);
		add: (self addRuleActionNamed: #child);
		add: (self clauseEditingAction);
		add: (parent removeRuleAction: self).
	^result copyWithout: nil
		
	