accessing
fillTruthTable: result 
	"Set values in a truth table to make it equivalent to me."
	children
		do: [:child | | tableToMerge | tableToMerge := child truthTable.
			result absorb: #always from: tableToMerge].
	result atAllOthersPut: #never