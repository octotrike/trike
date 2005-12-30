initialization
releaseMorph
	| result |
	result := StringMorph
				contents: self class applicationName, ' ', self class version
				font: (StrikeFont familyName: 'BitStreamVeraSerif' pointSize: 19).
	result
		beSticky;
		layoutFrame: (self layoutFrameFor: result).
	^ result