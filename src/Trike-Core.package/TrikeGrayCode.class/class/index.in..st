instance creation
index: aString in: aTruthTable
	"Answer a new instance of me, initialized with the appropriate values."

	^self new
		truthTable: aTruthTable;
		index: aString;
		yourself
		