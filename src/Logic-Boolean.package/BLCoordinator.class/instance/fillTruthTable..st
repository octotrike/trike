simplification
fillTruthTable: result 
	"Set values in a truth table to make it equivalent to me."
	| valueToAbsorb |
	valueToAbsorb := self valueToAbsorb.
	children
		do: [:child | 
			| tableToMerge | 
			tableToMerge := child asTruthTable.
			result absorb: valueToAbsorb from: tableToMerge].
	result atAllOthersPut: valueToAbsorb not