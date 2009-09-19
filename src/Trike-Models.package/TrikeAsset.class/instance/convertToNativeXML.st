conversion
convertToNativeXML
	| assetElement |
	assetElement := XMLElement new.
	assetElement name: 'asset'.
	assetElement attributeAt: 'name' put: self name;
		 attributeAt: 'id' put: self id asString;
		 attributeAt: 'value' put: self value asString;
		 attributeAt: 'inScope' put: self inScope asString.
	assetElement addElement: self notesAsNativeXML.
	^ assetElement