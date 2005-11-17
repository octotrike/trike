accessing
riskFactor: nilOrNumber 
	"Set my risk factor."
	| result |
	result := nilOrNumber ifNotNil: [nilOrNumber asInteger].
	result
		ifNotNil: [(result >= 1
					and: [result <= 5])
				ifFalse: [^ false]].
	riskFactor = result ifFalse: [
		riskFactor := result.
		self triggerEvent: #riskFactor].
	^ true