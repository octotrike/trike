streaming
printOn: aStream
	"Append a sequence of characters that identifies me to humans to aStream."
	
	super printOn: aStream.
	self label ifNotNil: [
		aStream nextPut: $(.
		self printLabelOn: aStream.
		aStream nextPut: $)]