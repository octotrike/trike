private
verb
	"Answer the verb in my class name." 
	| myName isAboutTo startOfVerb startOfObject verb |
	
	myName := self name asString.
	isAboutTo := self isAboutTo.
	startOfVerb := self prefix size + (isAboutTo ifTrue: [8] ifFalse: [1]).
	startOfObject := myName indexOfAnyOf: Character alphabet asUppercase asCharacterSet startingAt: (startOfVerb + 1).
	verb := myName copyFrom: startOfVerb to: startOfObject - 1.
	^(isAboutTo or: [verb endsWith: 'ed'])
		ifTrue: [verb]
		ifFalse: [nil]
