streaming
printOn: aStream 
	"Append a sequence of characters that identify me to aStream."
	super printOn: aStream.
	aStream nextPut: $(;
		 nextPutAll: self name;
		 nextPut: $)