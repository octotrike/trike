accessing
markUnknownActions: aSymbol
	"Set all unknown actions to aSymbol."

	self actions do: [:action |
		action setUnknownTo: aSymbol]