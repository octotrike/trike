event handling
update: aSymbol with: anObject 
	"Something I depend on has changed. Update myself accordingly."
	aSymbol = #name
		ifTrue: [self setNameTo: model name].
	aSymbol = #model
		ifTrue: [
			self setNameTo: model name.
			self pages do: [:m | 
				m model: anObject]].
	self pages do: [:m | 
		m update: aSymbol with: anObject].
	super update: aSymbol with: anObject