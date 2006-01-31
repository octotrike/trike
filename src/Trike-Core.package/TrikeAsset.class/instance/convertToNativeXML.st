conversion
convertToNativeXML
	| assetElement |
	assetElement := XMLElement new.
	assetElement name: 'asset'.
	assetElement attributeAt: 'name' put: self name;
		 attributeAt: 'id' put: self id;
		 attributeAt: 'value' put: self value;
		attributeAt: 'inScope' put: self inScope.
	assetElement addElement: XMLElement new;
		 name: 'notes';
		 addContent: self notes.
	^ assetElement