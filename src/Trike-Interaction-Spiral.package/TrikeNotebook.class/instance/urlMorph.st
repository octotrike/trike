initialization
urlMorph
	| result |
	result := StringMorph
				contents: 'http://www.octotrike.org/'
				font: (StrikeFont familyName: 'BitStreamVeraSerif' pointSize: 13).
	result
		beSticky;
		layoutFrame: (self layoutFrameFor: result).
	^ result