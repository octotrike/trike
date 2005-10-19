enumerating
inDo: aBlock	
	"Evaluate a block with each incoming link as the argument."

	in ifNotNil: [
		in do: aBlock]

