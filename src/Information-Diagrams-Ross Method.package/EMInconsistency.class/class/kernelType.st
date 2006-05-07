meta entity model
kernelType
	"Answer an instance of EMKernelType which represents me, for use in a meta entity model."
	
	| kernel |
	kernel := EMKernelType designated: self name asString.
	kernel description: self description.
	^kernel