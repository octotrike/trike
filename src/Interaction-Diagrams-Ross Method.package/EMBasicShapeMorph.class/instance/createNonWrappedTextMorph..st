initialization
createNonWrappedTextMorph: aStringOrText 
	| textMorph |
	textMorph := (self class textClass new)
				contentsAsIs: aStringOrText;
				vResizing: #shrinkWrap;
				margins: 4 @ 4;
				acceptOnFocusLoss: true;
				when: #accept
					send: #accept:from:
					to: self;
				hResizing: #shrinkWrap.
	textMorph
		layoutChanged;
		fullBounds.
	^textMorph