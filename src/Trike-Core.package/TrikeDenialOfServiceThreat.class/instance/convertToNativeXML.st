conversion
convertToNativeXML
	| attackElement |
	attackElement := XMLElement new.
	attackElement name: 'rule'.
	attackElement attributeAt: 'type' put: 'root';
		 attributeAt: 'target' put: 'action';
		 attributeAt: 'goal' put: 'less';
		 attributeAt: 'id' put: self id;
		attributeAt: 'exposure' put: self exposure;
		 attributeAt: 'name' put: self name.
	attackElement addElement: XMLElement new;
		 name: 'notes';
		 addContent: self notes.
	attackElement addElement: self childrenAsNativeXML.
	^ attackElement