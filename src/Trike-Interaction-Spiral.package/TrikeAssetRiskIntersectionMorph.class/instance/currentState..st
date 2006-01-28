accessing
currentState: riskValue 
	"Set my current state to riskValue."
	(colors keys includes: riskValue)
		ifFalse: [riskValue
				ifNotNil: [self error: 'No such state']].
	threat
		ifNotNil: [| newValue | 
			newValue := (#(#'N/A' #unknown ) includes: riskValue)
						ifFalse: [riskValue].
			threat riskFactor: newValue]