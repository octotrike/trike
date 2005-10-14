initialization
addAssetsSection
	"Construct the assets section."

	| book |
	book := TrikeAssetsSection new.
	self addPageLast: book.