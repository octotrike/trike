accessing
pasteUp: aMorph
	"Set the PasteUpMorph to which I will add morphs."
	 
	pasteUp := aMorph.
	layoutBox := pasteUp bounds insetBy: (100 min: pasteUp height / 6)
