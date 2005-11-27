conversion
convertToNativeXML
	"Answer an XMLElement in my native XML format."
	| resultXML |
	resultXML := self emptyNativeXML.
	resultXML addElement: self nativeNameXML;
		 addElement: self nativeAssetsXML;
		 addElement: self nativeActorsXML;
		 addElement: self nativeActionsXML;
		 addElement: self nativeAttacksXML.
	^ resultXML