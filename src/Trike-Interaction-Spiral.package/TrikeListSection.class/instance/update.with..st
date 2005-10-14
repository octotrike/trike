event handling
update: aSymbol with: anObject 
	"Something I depend on has changed. Update myself accordingly."
	aSymbol = self componentAddSymbol
		ifTrue: [self buildComponentMorphs: anObject].
	aSymbol = self componentRemoveSymbol
		ifTrue: [self removeComponentMorphs: anObject].
	super update: aSymbol with: anObject