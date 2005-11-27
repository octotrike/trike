streaming
printXMLOn: aStream 
	| resultXML |
	resultXML := self convertToNativeXML.
	resultXML printOn: aStream
	