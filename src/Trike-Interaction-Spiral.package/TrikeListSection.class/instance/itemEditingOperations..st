event handling
itemEditingOperations: aComponent 
	"Answer an OrderedCollection containing all item editing operations  
	my instances support."

	| result |
	result := OrderedCollection new.
	result add: (GenericAction 
				label: 'remove ' , self componentName
				receiver: aComponent
				selector: #remove
				arguments: #()).
	^result