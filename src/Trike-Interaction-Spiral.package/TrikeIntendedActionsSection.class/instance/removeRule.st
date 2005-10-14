event handling
removeRule
	"Remove the currently selected rule from its parent."
	currentTreeItem item removeRule: currentTreeItem model
	"What to do about knownActors?"