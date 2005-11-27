event handling
editIntendedActionActions: parent
	"Answer an OrderedCollection containing all operations
	my instances support for editing intended actions."
	"Parent is used in other implementations of this method."
	| result operation |
	result := OrderedCollection new.
	operation := self actionCreationAction.
	operation
		ifNotNil: [result add: operation].
	^result