accessing
pasteUp
	"Answer the PasteUpMorph to which I will add morphs."
	 
	^pasteUp ifNil: [ self currentWorld ]