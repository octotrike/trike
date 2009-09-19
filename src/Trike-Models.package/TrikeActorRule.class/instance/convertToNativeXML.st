conversion
convertToNativeXML
	| ruleElement |
	ruleElement := XMLElement new.
	ruleElement name: 'rule'.
	ruleElement attributeAt: 'type' put: 'role';
		 attributeAt: 'id' put: self id asString;
		 attributeAt: 'negated' put: self not asString.
	ruleElement addElement: self notesAsNativeXML.
	ruleElement addElement: self actor referenceAsNativeXML.
	^ ruleElement