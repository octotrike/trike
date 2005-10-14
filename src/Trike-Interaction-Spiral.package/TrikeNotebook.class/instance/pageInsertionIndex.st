accessing
pageInsertionIndex
	"Answer the index at which to add a new page."
	^ pages
		ifEmpty: []
		ifNotEmpty: [pages size - 1]