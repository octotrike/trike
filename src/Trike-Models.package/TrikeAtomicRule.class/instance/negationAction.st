event handling
negationAction
	"Answer a GenericAction for negating my clause."
	^ GenericAction
		label: 'Negate Selected Rule'
		receiver: self
		selector: #toggleNot
		arguments: #()