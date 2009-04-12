instance creation
signalWith: parameter
	"Signal the occurrence of an exceptional condition, with a parameter."

	^(self new)
		tag: parameter