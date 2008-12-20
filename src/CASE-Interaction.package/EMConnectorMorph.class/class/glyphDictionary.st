accessing
glyphDictionary
	"Answer a dictionary of glyphs appropriate for arrow ends in entity models."
	^ArrowGlyphs ifNil: [
		ArrowGlyphs _ Dictionary new.
		self initializeArrowDictionary ].