event handling
editIntendedActionActions: parent 
	"Answer an OrderedCollection containing all operations 
	my instances support for editing intended actions."
	| result |
	result := OrderedCollection new.
	result
		add: (parent addActionNamed: #sibling);
		
		add: (self addActionNamed: #child);
		
		add: (parent removeAction: self);
		add: (self unlinkingFromAction: parent);
		add: self clauseEditingAction;
		add: self negationAction;
		add: self simplificationAction;
		
		addAll: (parent treeEditingActions: self).
	^ result copyWithout: nil