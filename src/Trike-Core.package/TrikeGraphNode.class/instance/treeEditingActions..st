event handling
treeEditingActions: child
	"Answer an OrderedCollection containing all operations
	my instances support for editing my child's position in a tree."
	| result |
	result := OrderedCollection new.
	result
		add: (self promoteAction: child);
		add: (self demoteAction: child);
		add: (self moveUpAction: child);
		add: (self moveDownAction: child).
	^result