accessing
toggleNot
	"Toggle whether my sense is inverted."
	self not: (not
				ifTrue: [false]
				ifFalse: [true])