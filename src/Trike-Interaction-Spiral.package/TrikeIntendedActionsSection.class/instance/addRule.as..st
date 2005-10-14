event handling
addRule: aRule as: childOrSibling 
	| parent |
	parent := currentTreeItem model.
	childOrSibling = #sibling ifTrue: [parent := currentTreeItem item].
	parent ifNil: [^self].
	parent addRule: aRule.
	parent topLevel 
		ifTrue: 
			["Because an analyst added this rule using the tree view, we assume the analyst intends to construct the rules entirely using the tree view, so we populate knownActors with all currently known actors."

			parent applyRuleToAllActors]
		ifFalse: 
			["What do we need to do to knownActors in this case?"

			]