accessing
toggleNot
	"Toggle whether my sense is inverted."
	not := not
				ifTrue: [false]
				ifFalse: [true]