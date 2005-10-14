event handling
addAction: aSymbol on: anAsset 
	| action |
	action := anAsset actionAt: aSymbol.
	action intended: true.
	"Because an analyst added this action using the tree view, we assume the analyst intends to construct the rules entirely using the tree view, so we populate knownActors with all currently known actors."
	action applyRuleToAllActors