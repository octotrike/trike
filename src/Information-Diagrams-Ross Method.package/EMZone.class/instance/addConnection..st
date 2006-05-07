accessing
addConnection: newConnection
	"Add a connection from my model to this zone."

	model ifNil: [
		EMInconsistency signal: 'undefined model cannot contain connection being added to zone'].
	newConnection ifNil: [
		EMInconsistency signal: 'cannot add undefined connection to zone'].
	(model includesConnection: newConnection) ifFalse: [
		EMInconsistency signal: 'connection being added to zone does not appear in model'].
	connections add: newConnection.
	self triggerEvent: #addConnection: with: newConnection.