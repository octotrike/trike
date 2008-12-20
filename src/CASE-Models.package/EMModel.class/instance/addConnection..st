accessing
addConnection: newConnection 
	"Add a connection to my model."
	newConnection
		ifNil: [EMInconsistency signal: 'cannot add undefined connection to model'].
	connections add: newConnection.
	self triggerEvent: #addObject: with: newConnection