event handling
negationAction
	"Answer a GenericAction for negating my clause."
	^ GenericAction
		label: 'negate selected rule'
		receiver: self
		selector: #negate
		arguments: #()