conversion
nativeAssetsXML
	| assetsXML |
	assetsXML := XMLElement named: 'assets'.
	self assets
		do: [:asset | assetsXML addElement: asset convertToNativeXML].
	^ assetsXML