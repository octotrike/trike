event handling
removeAllRules
	| action |
	action := currentTreeItem model.
	action rule: nil.
	"Because an analyst removed the rules using the tree view, we assume 
	e was serious."
	action applyRuleToAllActors