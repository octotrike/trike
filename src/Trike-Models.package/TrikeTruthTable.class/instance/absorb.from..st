initialization
absorb: aSymbol from: anotherTruthTable 
	"Any value marked with aSymbol in anotherTruthTable should be 
	marked with the same symbol in me. My atomicTerms are assumed 
	to be a superset of anotherTruthTable's atomic terms."
	anotherTruthTable grayCodes
		do: [:otherCode | (anotherTruthTable at: otherCode)
					= aSymbol
				ifTrue: [| myCode | 
					myCode := otherCode equivalentIn: self.
					self at: myCode put: aSymbol]]