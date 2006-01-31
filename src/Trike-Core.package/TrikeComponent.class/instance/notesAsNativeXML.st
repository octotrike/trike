conversion
notesAsNativeXML
	| notesElement |
	notesElement := XMLElement new.
	notesElement name: 'notes'.
	self notes
		ifNil: [notesElement addContent: (XMLStringNode string: '')]
		ifNotNil: [notesElement addContent: (XMLStringNode string: self notes)].
	^ notesElement