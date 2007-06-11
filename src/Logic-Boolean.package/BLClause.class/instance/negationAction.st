actions
negationAction
	"Answer a GenericAction for negating my clause."
	^ GenericAction
		label: 'Negate Selected ', self label
		receiver: self
		selector: #toggleNegated
		arguments: #()