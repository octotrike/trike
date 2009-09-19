initialization
atAllOthersPut: aSymbol 
	"Mark all nil values in my truthTable with aSymbol."
	1
		to: truthTable size
		do: [:index | (truthTable at: index)
				ifNil: [truthTable at: index put: aSymbol]]