accessing
removeConnection: formerConnection
	"Remove a connection from this zone."

	formerConnection ifNil: [
		EMInconsistency signal: 'cannot remove undefined connection from zone'].
	connections remove: formerConnection ifAbsent: [
		EMInconsistency signal: 'cannot remove nonexistent connection from zone'].
	self triggerEvent: #removeConnection: with: formerConnection.