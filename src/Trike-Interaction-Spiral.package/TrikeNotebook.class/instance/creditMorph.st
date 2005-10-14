initialization
creditMorph
	"Answer a Morph containing the credits."
	| result creditFont |
	result := AlignmentMorph newColumn.
	result changeGridLayout; beTransparent; beSticky; listDirection: #leftToRight; columnCount: 2; hResizing: #spaceFill; cellInset: 2.
	creditFont := StrikeFont familyName: 'BitStreamVeraSerif' pointSize: 13.
	self credits
		do: [:assoc | 
			| title peeps | 
			title := StringMorph contents: assoc key font: creditFont.
			peeps := StringMorph contents: assoc value.
			result addMorphBack: title;
				 addMorphBack: peeps].
	result fullBounds.
	result
		layoutFrame: (self layoutFrameFor: result).
	^ result