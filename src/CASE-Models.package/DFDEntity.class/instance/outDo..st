enumerating
outDo: aBlock	
	"Evaluate a block with each outgoing link as the argument."

	out ifNotNil: [
		out do: aBlock]
