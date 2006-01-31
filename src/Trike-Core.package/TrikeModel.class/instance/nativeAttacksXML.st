conversion
nativeAttacksXML
	| attacksXML |
	attacksXML := XMLElement named: 'attacks'.
	self attacks
		nodesDo: [:attack | attacksXML addElement: attack convertToNativeXML].
	^ attacksXML