streaming
printLabelOn: aStream
	"Append my qualified label to aStream."
	
	aStream nextPutAll: label.
	self parent ifNotNil: [
		self parent printLabelQualifierOn: aStream for: self]