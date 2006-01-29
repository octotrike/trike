accessing
statesToColors
	"Answer a dictionary which maps state symbols to colors."
	| statesToColors unknownColor riskColor |
	statesToColors := Dictionary new.
	riskColor := Color red mixed: 0.6 with: Color black.
	unknownColor := Color yellow.
	statesToColors at: #Unknown put: unknownColor.
	1
		to: 5
		do: [:riskLevel | statesToColors
				at: riskLevel
				put: (riskColor mixed: 0.2 * riskLevel with: Color white)].
	statesToColors at: #'N/A' put: Color black.
	^ statesToColors