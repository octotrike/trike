accessing
pageInsertionIndex
	"Answer the index at which to add a new page."
	^ (pages size - 2) max: 0