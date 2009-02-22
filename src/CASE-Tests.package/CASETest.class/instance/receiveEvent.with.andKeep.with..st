accessing
receiveEvent: anObject with: index andKeep: newValue with: aSymbol
	"Add aSymbol to my collection of received events."
	
	receivedEvents add: newValue 
	
	