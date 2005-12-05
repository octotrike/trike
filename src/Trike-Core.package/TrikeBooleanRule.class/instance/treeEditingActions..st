event handling
treeEditingActions: child
	"Answer an OrderedCollection containing all operations
	my instances support for editing my child's position in a tree."
	| result |
	result := OrderedCollection new.
	result
		add: (self promoteRuleAction: child);
		add: (self demoteRuleAction: child);
		add: (self moveRuleUpAction: child);
		add: (self moveRuleDownAction: child).
	^result
		
	