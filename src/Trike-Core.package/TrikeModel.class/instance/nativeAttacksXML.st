conversion
nativeAttacksXML
	| attacksXML |
	attacksXML := XMLElement named: 'attacks'.
	self attacks
		do: [:attack | attack nodesDo: [:att | attacksXML addElement: att convertToNativeXML]].
	^ attacksXML