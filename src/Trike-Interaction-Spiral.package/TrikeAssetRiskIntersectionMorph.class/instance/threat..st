accessing
threat: newThreat 
	"Set my threat to newThreat."
	threat = newThreat ifTrue: [^self].
	self unregisterForThreatEvents.
	threat := newThreat.
	self registerForThreatEvents.
	self currentStateChanged