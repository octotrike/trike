event handling
editAttackActions: parent 
	"Answer an OrderedCollection containing all operations 
	my instances support for editing attacks."
	| result |
	result := OrderedCollection new.
	parent ifNotNil: [
		result add: (parent addActionNamed: #sibling)].
	result
		add: (self addActionNamed: #child).
	"copy node, copy subtree, paste"
	parent ifNotNil: [
		result 
			add: (parent removeAction: self);
			addAll: (parent treeEditingActions: self)].
	^ result copyWithout: nil