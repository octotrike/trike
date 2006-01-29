accessing
statesToColors
	"Answer a dictionary which maps state symbols to colors."
	| statesToColors alwaysColor unknownColor neverColor sometimesColor |
	statesToColors := Dictionary new.
	alwaysColor := Color blue mixed: 0.6 with: Color black.
	unknownColor := Color yellow.
	neverColor := Color
				r: 0.757
				g: 0.757
				b: 0.757.
	sometimesColor := alwaysColor mixed: 0.5 with: neverColor.
	statesToColors at: #Unknown put: unknownColor;
		 at: #Never put: neverColor;
		 at: #Sometimes put: sometimesColor;
		 at: #Always put: alwaysColor.
	^ statesToColors