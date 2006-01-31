conversion
convertToNativeXML
	| attackElement |
	attackElement := XMLElement new.
	attackElement name: 'rule'.
	attackElement attributeAt: 'type' put: 'and';
		 attributeAt: 'id' put: self id asString;
		 attributeAt: 'name' put: self name.
	attackElement addElement: self notesAsNativeXML.
	attackElement addElement: self childrenAsNativeXML.
	^ attackElement