accessing
model
	"Answer my model."
	^ model
		ifNil: [parents ifNotEmpty: [parents any model]]