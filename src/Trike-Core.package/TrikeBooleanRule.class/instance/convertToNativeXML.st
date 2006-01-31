conversion
convertToNativeXML
	| ruleElement |
	ruleElement := XMLElement new.
	ruleElement name: 'rule'.
	ruleElement attributeAt: 'type' put: self name;
		 attributeAt: 'id' put: self id.
	ruleElement addElement: XMLElement new;
		 name: 'notes';
		 addContent: self notes.
	ruleElement addElement: self childrenAsNativeXML.
	^ ruleElement