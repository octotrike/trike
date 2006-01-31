conversion
convertToNativeXML
	| actorElement |
	actorElement := XMLElement new.
	actorElement name: 'asset'.
	actorElement attributeAt: 'name' put: self name;
		 attributeAt: 'id' put: self id;
		 attributeAt: 'risk' put: self risk.
	actorElement addElement: XMLElement new;
		 name: 'notes';
		 addContent: self notes.
	^ actorElement