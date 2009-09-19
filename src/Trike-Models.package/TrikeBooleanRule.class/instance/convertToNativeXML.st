conversion
convertToNativeXML
	| ruleElement |
	ruleElement := XMLElement new.
	ruleElement name: 'rule'.
	ruleElement attributeAt: 'type' put: self name;
		 attributeAt: 'id' put: self id asString.
	ruleElement addElement: self notesAsNativeXML.
	ruleElement addElement: self childrenAsNativeXML.
	^ ruleElement