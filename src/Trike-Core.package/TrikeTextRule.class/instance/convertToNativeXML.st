conversion
convertToNativeXML
	| ruleElement |
	ruleElement := XMLElement new.
	ruleElement name: 'rule'.
	ruleElement attributeAt: 'type' put: 'text';
		 attributeAt: 'id' put: self id;
		 attributeAt: 'negated' put: self negated;
		attributeAt: 'name' put: self name.
	ruleElement addElement: XMLElement new;
		 name: 'notes';
		 addContent: self notes.
	^ ruleElement