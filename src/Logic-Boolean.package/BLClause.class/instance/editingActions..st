actions
editingActions: parent 
	"Answer an OrderedCollection containing all operations 
	my instances support for editing."
	| result |
	result := OrderedCollection new.
	result
		add: (parent addActionNamed: #sibling);
		
		add: (self addActionNamed: #child);
		
		add: (parent removeAction: self);
		add: self valueModificationAction;
		add: self negationAction;
		add: self simplificationAction;
		
		addAll: (parent treeEditingActions: self).
	^ result copyWithout: nil