construction
addRow: component 
	"Insert a row for component."
	| row label |
	self rowCount: self rowCount + 1.
	row := self rowCount.
	label := self labelMorphFor: component.
	self
		addMorph: label
		asElementNumber: (self layoutPolicy indexFromGridSquare: 1 @ row horizontal: true).
	self populateRow: row for: component