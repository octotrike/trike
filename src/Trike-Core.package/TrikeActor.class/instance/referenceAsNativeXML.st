conversion
referenceAsNativeXML
	| referenceElement |
	referenceElement := XMLElement new.
	referenceElement name: 'actor';
		 attributeAt: 'reference' put: self id asString.
	^ referenceElement