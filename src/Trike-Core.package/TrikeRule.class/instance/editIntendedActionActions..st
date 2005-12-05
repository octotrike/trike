event handling
editIntendedActionActions: parent 
	"Answer an OrderedCollection containing all operations 
	my instances support for editing intended actions."
	| result |
	result := OrderedCollection new.
	result
		add: (parent addRuleActionNamed: #sibling);
		
		add: (self addRuleActionNamed: #child);
		
		add: (parent removeRuleAction: self);
		 add: self clauseEditingAction;
		 add: self negationAction;
		 add: self simplificationAction;
		
		addAll: (parent treeEditingActions: self).
	^ result copyWithout: nil