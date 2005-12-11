event handling
editComponentActions
	"Answer an OrderedCollection containing all item editing operations  
	my instances support."

	| result |
	result := OrderedCollection new.
	result add: (GenericAction 
				label: 'remove ' , self class label
				receiver: self
				selector: #remove
				arguments: #()).
	^result