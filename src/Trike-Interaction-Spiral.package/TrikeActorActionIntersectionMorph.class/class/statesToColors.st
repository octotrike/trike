accessing
statesToColors
	"Answer a dictionary which maps state symbols to colors."
	| statesToColors alwaysColor unknownColor neverColor sometimesColor |
	statesToColors := Dictionary new.
	alwaysColor := Color blue mixed: 0.6 with: Color black.
	unknownColor := Color yellow.
	neverColor := Color r: 0.757 g: 0.757 b:0.757.
	sometimesColor := alwaysColor mixed: 0.5 with: neverColor.

	statesToColors at: #unknown put: unknownColor;
		 at: #never put: neverColor;
		 at: #sometimes put: sometimesColor;
		 at: #always put: alwaysColor.
	^ statesToColors