conversion
convertToNativeXML
	| attackElement |
	attackElement := XMLElement new.
	attackElement name: 'attack'.
	attackElement attributeAt: 'type' put: 'root';
		 attributeAt: 'target' put: 'action';
		 attributeAt: 'goal' put: 'less';
		 attributeAt: 'id' put: self id asString;
		 attributeAt: 'exposure' put: self exposure asString;
		 attributeAt: 'name' put: self name.
	attackElement addElement: self notesAsNativeXML.
	attackElement addElement: self childrenAsNativeXML.
	^ attackElement