running
testSessionFor
	"Confirm that if a component is in a given model repository, it will always get a session for that same model repository."
	| directory session parent child |
	
	directory := 'testSessionFor'.
	session := self targetClass on: directory createIfNeeded: true.
	parent := CASEComponent labeled: 'parent'.
	session add: parent.
	child := CASEComponent labeled: 'child'.
	self should: [self targetClass sessionFor: child = self targetClass default].
	self should: [self targetClass sessionFor: child = child session].
	parent add: child.
	self should: [self targetClass sessionFor: child = child session].
	self shouldnt: [self targetClass sessionFor: child = self targetClass default].
	self should: [self targetClass sessionFor: child = session].
	session deleteRepository
	self shouldnt: [FileDirectory default directoryExists: directory]
