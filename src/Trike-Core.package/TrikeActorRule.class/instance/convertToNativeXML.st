conversion
convertToNativeXML
	| ruleElement |
	ruleElement := XMLElement new.
	ruleElement name: 'rule'.
	ruleElement attributeAt: 'type' put: 'role';
		 attributeAt: 'id' put: self id;
		 attributeAt: 'negated' put: self negated.
		ruleElement addElement: XMLElement new;
		 name: 'notes';
		 addContent: self notes.
	ruleElement addElement: self actor referenceAsNativeXML.
	^ ruleElement