construction
addIntersectionOf: columnComponent and: rowComponent at: aGridSquare 
	"Add a Morph to represent the given intersection at aGridSquare."
	| gridMorph possibleActions |
	possibleActions := rowComponent possibleActions.
	gridMorph := AlignmentMorph new.
	gridMorph beTransparent; changeGridLayout; changeListDirection: #leftToRight; hResizing: #shrinkWrap; vResizing: #shrinkWrap; cellPositioning: #topLeft; columnCount: possibleActions size sqrt rounded; rowCount: nil.
	possibleActions
		do: [:action | gridMorph
				addMorphBack: (self gridSquareClass
						for: columnComponent
						action: action
						andAsset: rowComponent)].
	self
		addMorph: gridMorph
		asElementNumber: (self layoutPolicy indexFromGridSquare: aGridSquare horizontal: true)