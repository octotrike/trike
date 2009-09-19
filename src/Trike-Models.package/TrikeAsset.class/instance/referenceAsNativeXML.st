conversion
referenceAsNativeXML
	| referenceElement |
	referenceElement := XMLElement new.
	referenceElement name: 'asset';
		 attributeAt: 'reference' put: self id asString.
	^ referenceElement