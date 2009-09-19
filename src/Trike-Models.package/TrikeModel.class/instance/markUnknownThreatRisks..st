accessing
markUnknownThreatRisks: anInteger
	"Set all unknown threat risks to anInteger."

	self attacks do: [:threat |
		threat riskFactor ifNil: [threat riskFactor: anInteger]]