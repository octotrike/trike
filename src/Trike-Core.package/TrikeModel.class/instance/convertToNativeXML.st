conversion
convertToNativeXML
	"Answer an XMLElement in my native XML format."
	| resultXML modelXML |
	resultXML := self emptyNativeXML.
	modelXML := resultXML elementAt: 'model'.	
	modelXML attributeAt: 'name'
		put: self name;
		 addElement: self nativeAssetsXML;
		 addElement: self nativeActorsXML;
		 addElement: self nativeRulesXML;
		 addElement: self nativeActionsXML;
		 addElement: self nativeAttacksXML.
	^ resultXML