instance creation
named: identifyingString in: model
	"Answer a new instance of me with the given identifyingString for a  
	name, and connect it to the given model."
	^(identifyingString = self newComponentString or: [identifyingString = ''])
		ifTrue: [nil]
		ifFalse: [self new name: identifyingString; model: model]