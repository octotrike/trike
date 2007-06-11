accessing
toggleNegated
	"Toggle whether my sense is inverted."
	self
		isNegated: (not
				ifTrue: [false]
				ifFalse: [true])