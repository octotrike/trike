initialization
addActorsSection
	"Construct the actors section."

	| book |
	book := TrikeActorsSection new.
	self addPageLast: book