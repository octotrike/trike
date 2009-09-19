initialization
addTerms: aCollection 
	"Add the given terms to my atomicTerms."
	(truthTable notNil
			and: [truthTable
					detect: [:entry | entry notNil]])
		ifTrue: [self error: 'Data would be lost'].
	atomicTerms addAllFirstUnlessAlreadyPresent: aCollection.
	grayCodes := TrikeGrayCode codesFor: self.
	truthTable := Array new: grayCodes size