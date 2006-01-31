conversion
convertToNativeXML
	| ruleElement |
	ruleElement := XMLElement new.
	ruleElement name: 'rule'.
	ruleElement attributeAt: 'type' put: 'text';
		 attributeAt: 'id' put: self id asString;
		 attributeAt: 'negated' put: self negated asString;
		 attributeAt: 'name' put: self name.
	ruleElement addElement: self notesAsNativeXML.
	^ ruleElement