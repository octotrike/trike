streaming
printLabelOn: aStream
	"Append my qualified label to aStream."
	
	aStream nextPutAll: label.
	parent ifNotNil: [
		parent printLabelQualifierOn: aStream for: self]