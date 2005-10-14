accessing
findComponentForColumn: columnNumber 
	"Answer the TrikeComponent associated with the given 
	columnNumber. "
	| columnMorph |
	columnMorph := submorphs
				at: (self layoutPolicy indexFromGridSquare: columnNumber @ 1 horizontal: true).
	^ columnMorph submorphs first target