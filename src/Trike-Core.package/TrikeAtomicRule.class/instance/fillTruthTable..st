accessing
fillTruthTable: aTruthTable 
	"Set values in a truth table to make it equivalent to me."
	not
		ifTrue: [aTruthTable
				at: (TrikeGrayCode index: '0' in: aTruthTable)
				put: #Always;
				
				at: (TrikeGrayCode index: '1' in: aTruthTable)
				put: #Never]
		ifFalse: [aTruthTable
				at: (TrikeGrayCode index: '0' in: aTruthTable)
				put: #Never;
				
				at: (TrikeGrayCode index: '1' in: aTruthTable)
				put: #Always]