event handling
itemEditingActions
	"Answer an OrderedCollection containing all editing 
	operations my instances support."
	^currentTreeItem model perform: self itemEditingActionsSelector with: currentTreeItem item