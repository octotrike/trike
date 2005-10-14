accessing
threat: newThreat 
	"Set my threat to newThreat."
	threat = newThreat
		ifFalse: [threat
				ifNotNil: [threat removeDependent: self].
			threat := newThreat.
			threat
				ifNotNil: [threat addDependent: self]].
	self changed: #currentState