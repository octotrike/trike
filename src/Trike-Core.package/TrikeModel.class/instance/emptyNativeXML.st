streaming
emptyNativeXML
	"Answer an empty XMLElement in my native XML format."
	| modelElement nativeXML |
	nativeXML := XMLDocument new.
      nativeXML version: '1.0'; encoding: 'utf-8'.
	modelElement := XMLElement new.
      modelElement name: 'model'.
 modelElement attributeAt: 'xmlns' put: 'http://www.octotrike.org/XSD/TrikeModel/' + TrikeModel methodologyVersion + '.' + TrikeModel nativeFileFormatVersion; attributeAt: 'name' put: ''.
	nativeXML addElement: modelElement.
	^ nativeXML