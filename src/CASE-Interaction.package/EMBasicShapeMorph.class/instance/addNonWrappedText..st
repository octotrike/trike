accessing
addNonWrappedText: aStringOrText 
	"Answers a text index"

	| textMorph itsWidth |
	textMorph := self createNonWrappedTextMorph: aStringOrText.
	itsWidth := textMorph width.
	self addMorphBack: textMorph.
	itsWidth > self width
		ifTrue: [self width: itsWidth + 10]
		ifFalse: [ self adjustSubmorphPositions ].
	^self textMorphs size
