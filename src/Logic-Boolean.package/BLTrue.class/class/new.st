instance creation
new
	"Answer a new instance of myself."
	instance ifNotNil: [self shouldNotImplement].
	^super new