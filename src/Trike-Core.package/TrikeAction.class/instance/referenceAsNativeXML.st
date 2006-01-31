conversion
referenceAsNativeXML
	| referenceElement |
	referenceElement := XMLElement new.
	referenceElement name: 'action';
		 attributeAt: 'reference' put: self id asString.
	^ referenceElement