instance creation
codesFor: aTruthTable
	"Answer a gray code for the given truth table."
	^(self indicesFor: aTruthTable atomicTerms size) collect: [:index |
		self index: index in: aTruthTable]