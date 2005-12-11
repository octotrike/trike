event handling
itemEditingActions: aComponent 
	"Answer an OrderedCollection containing all item editing operations  
	my instances support."

	^aComponent perform: self itemEditingActionsSelector