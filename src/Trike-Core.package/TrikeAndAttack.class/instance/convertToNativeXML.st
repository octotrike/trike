conversion
convertToNativeXML
	| attackElement |
	attackElement := XMLElement new.
	attackElement name: 'rule'.
	attackElement attributeAt: 'type' put: 'and';
		 attributeAt: 'id' put: self id;
		attributeAt: 'name' put: self name.
	attackElement addElement: XMLElement new;
		 name: 'notes';
		 addContent: self notes.
	attackElement addElement: self childrenAsNativeXML.
	^ attackElement