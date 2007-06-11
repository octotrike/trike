simplification
fillTruthTable: aTruthTable 
	"Set values in a truth table to make it equivalent to me."
	not
		ifTrue: [aTruthTable
				at: (BLGrayCode index: '0' in: aTruthTable)
				put: true;
				
				at: (BLGrayCode index: '1' in: aTruthTable)
				put: false]
		ifFalse: [aTruthTable
				at: (BLGrayCode index: '0' in: aTruthTable)
				put: false;
				
				at: (BLGrayCode index: '1' in: aTruthTable)
				put: true]