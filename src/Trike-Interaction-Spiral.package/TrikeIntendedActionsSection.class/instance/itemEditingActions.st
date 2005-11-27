event handling
itemEditingActions
	"Answer an OrderedCollection containing all rule editing operations  
	my instances support."
	| result |
	result := OrderedCollection new.
	{model. currentTreeItem model} do: [:interestingReceiver |
		result addAll: (interestingReceiver editIntendedActionActions: currentTreeItem item)].
	^result
	