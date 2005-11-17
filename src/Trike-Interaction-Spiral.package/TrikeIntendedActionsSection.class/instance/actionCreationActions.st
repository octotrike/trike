event handling
actionCreationActions
	"Answer an OrderedCollection containing all action creation  
	operations my instances support."
	| result |
	result := model assets collect: [:asset | 
		asset inScope
			ifTrue: [
				GenericActions
					label: asset name
					receiver: asset
					selector: #actionCreationActionsOn:
					arguments: {self}]
			ifFalse: [nil]].
	^result copyWithout: nil