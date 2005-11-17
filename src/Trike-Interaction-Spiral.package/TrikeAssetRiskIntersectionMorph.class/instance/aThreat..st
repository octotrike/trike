accessing
aThreat: newThreat 
	"If newThreat matches me, set my threat to newThreat."
	(newThreat class =  parameter and: [newThreat action action = actionSymbol]) ifTrue: [
		self threat: newThreat]