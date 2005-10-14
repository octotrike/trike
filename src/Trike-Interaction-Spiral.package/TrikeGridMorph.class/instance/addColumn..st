construction
addColumn: component
	"Insert a column for component."
	| column label rotation |
	self columnCount: self columnCount + 1.
	column := self columnCount.
	label := self labelMorphFor: component.
	rotation := TransformationMorph new.
	rotation rotationDegrees: -90;
		 addMorph: label.
	self
		addMorph: rotation
		asElementNumber: (self layoutPolicy indexFromGridSquare: column @ 1 horizontal: true).
	self populateColumn: column for: component