accessing
currentState
	"Answer my current state."
	^ threat
		ifNil: [#'N/A']
		ifNotNil: [threat riskFactor
				ifNil: [#Unknown]]