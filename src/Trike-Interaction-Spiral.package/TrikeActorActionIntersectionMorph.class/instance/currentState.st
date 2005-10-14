accessing
currentState
	"Answer my current state."

	^action ifNotNil: [action rulesForActor: parameter]