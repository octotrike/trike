accessing
receiveEvent: anObject with: newValue andKeep: aSymbol
	"Add aSymbol to my collection of received events."
	
	receivedEvents add: aSymbol 
	
	