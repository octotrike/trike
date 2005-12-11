event handling
addNodeToActions: parent
	"Answer an OrderedCollection of GenericActions for adding an instance of me to the given parent."
	^parent model actors collect: [:actor | 
		GenericAction
			label: actor name
			receiver: self
			selector: #addNodeTo:withConstraint:
			arguments: {parent. actor}]
		