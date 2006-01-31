conversion
notesAsNativeXML
	| notesElement |
	notesElement := XMLElement new.
	notesElement name: 'notes'.
self notes
				ifNil: [ notesElement attributeAt: 'text' put: '']
				ifNotNil: [notesElement
		attributeAt: 'text'
		put: self notes].	
	^ notesElement