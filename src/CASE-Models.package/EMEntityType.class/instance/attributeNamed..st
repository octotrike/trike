accessing
attributeNamed: attributeDesignation
	"Answer my attribute with the given designation."
	
	^attributes at: attributeDesignation ifAbsent: [self shouldBeImplemented]