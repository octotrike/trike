conversion
referenceAsNativeXML
	| referenceElement |
	referenceElement := XMLElement new.
	referenceElement name: 'rule';
		 attributeAt: 'reference' put: self id asString.
	^ referenceElement