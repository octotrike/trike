conversion
nativeActorsXML
	| actorsXML |
	actorsXML := XMLElement named: 'actors'.
	self actors
		do: [:actor | actorsXML addElement: actor convertToNativeXML].
	^ actorsXML