conversion
convertToNativeXML
	| attackElement |
	attackElement := XMLElement new.
	attackElement name: 'attack'.
	attackElement attributeAt: 'type' put: 'OR';
		 attributeAt: 'id' put: self id asString;
		 attributeAt: 'name' put: self name.
	attackElement addElement: self notesAsNativeXML.
	attackElement addElement: self childrenAsNativeXML.
	^ attackElement