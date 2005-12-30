event handling
treeEditingActions
	"Answer an OrderedCollection containing all editing 
	operations my tree supports."
	| result |
	result := OrderedCollection new.
	result add: model actionCreationAction.
	^result