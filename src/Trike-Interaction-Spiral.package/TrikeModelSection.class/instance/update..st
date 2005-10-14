event handling
update: aSymbol 
	"Something I depend on has changed.  Update myself accordingly."

	self pages do: [:m | m update: aSymbol]