event handling
removeAction
	| action |
	action := currentTreeItem model.
	action intended: false.
	"Because an analyst removed this action using the tree view, we assume the analyst intends to apply the change all currently known actors."
	action applyRuleToAllActors