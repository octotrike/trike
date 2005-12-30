utilities
assert: aBlock failureMessage: errorString
	"Throw an assertion if aBlock does not evaluate to true."
	
	aBlock value ifFalse: [AssertionFailure signal: errorString]