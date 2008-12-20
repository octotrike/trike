accessing
graphModel: aKernelType
	"Set my graphModel to aKernelType."
	
	self pvtGraphModel: aKernelType.
	aKernelType ifNotNil: [
		self replaceTextMorph: self firstEmptyTextMorph with: 
			(self createNonWrappedTextMorph: aKernelType designation)].

	