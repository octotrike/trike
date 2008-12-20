instance creation
of: entityModel on: aMorph
	"Answer a new instance of me, to add morphs to aMorph."
	
	^(self new)
		pasteUp: aMorph;
		model: entityModel;
		yourself