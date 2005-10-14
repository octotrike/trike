accessing
findComponentForRow: rowNumber 
	"Answer the TrikeComponent associated with the given rowNumber."
	| rowMorph |
	rowMorph := self submorphs
				at: (self layoutPolicy indexFromGridSquare: 1 @ rowNumber horizontal: true).
	^ rowMorph target