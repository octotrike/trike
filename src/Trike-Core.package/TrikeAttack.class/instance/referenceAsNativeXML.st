conversion
referenceAsNativeXML
	| referenceElement |
	referenceElement := XMLElement new.
	referenceElement name: 'attack';
		 attributeAt: 'reference' put: self id asString.
	^ referenceElement