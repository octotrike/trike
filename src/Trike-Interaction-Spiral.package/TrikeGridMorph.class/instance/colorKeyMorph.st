accessing
colorKeyMorph
	"Answer a Morph containing a key to my colors."
	| keyMorphs holderMorph |
	keyMorphs := self gridSquareClass states
				collect: [:symbol | 
					| gridColor keyName | 
					gridColor := self gridSquareClass statesToColors at: symbol.
					keyName := StringMorph contents: symbol asString.
					keyName
						color: (Color black orColorUnlike: gridColor).
					AlignmentMorph new color: gridColor;
						 hResizing: #spaceFill;
						 vResizing: #shrinkWrap;
						 addMorph: keyName;
						 yourself].
	holderMorph := AlignmentMorph inAColumn: keyMorphs.
	holderMorph borderWidth: 0;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutInset: 0.
	^ holderMorph