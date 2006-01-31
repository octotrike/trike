conversion
convertToNativeXML
	| actorElement |
	actorElement := XMLElement new.
	actorElement name: 'asset'.
	actorElement attributeAt: 'name' put: self name;
		 attributeAt: 'id' put: self id asString;
		 attributeAt: 'risk' put: self risk asString.
	actorElement addElement: self notesAsNativeXML.
	^ actorElement