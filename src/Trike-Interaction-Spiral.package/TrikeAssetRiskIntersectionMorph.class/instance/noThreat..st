accessing
noThreat: oldThreat 
	"If oldThreat matches me, set my threat to nil."
	threat = oldThreat ifTrue: [
		self threat: nil]