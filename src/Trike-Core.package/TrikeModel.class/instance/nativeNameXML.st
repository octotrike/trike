conversion
nativeNameXML
	"Answer an XMLElement for my name, for use in my native XML format."
	| resultXML |
	resultXML := XMLElement named: 'Name' attributes: Dictionary new.
	resultXML addContent: (XMLStringNode string: self name asString).
	^resultXML