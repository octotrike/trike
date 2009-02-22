accessing
receiveEvent: anObject andKeep: newValue with: aSymbol
	"Add newValue to my collection of received events."
	
	receivedEvents add: newValue 
	
	