event handling
editRule: constrainingObject 
	| current |
	current := currentTreeItem model.
	current perform: current constraintSelector with: constrainingObject