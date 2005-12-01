event handling
itemEditingActions
	"Answer an OrderedCollection containing all editing 
	operations my instances support."
	| result |
	result := OrderedCollection new.
	result
		addAll: (currentTreeItem model perform: self itemEditingActionsSelector with: currentTreeItem item).
	^ result