initialization
addAll
	"Add all of my model's objects & connections to my pasteUp."
	
	pasteUp ifNil: [^#()].
	model objects do: [:object | self addMorphsFor: object].
	model connections do: [:connection | self addMorphsFor: connection].
