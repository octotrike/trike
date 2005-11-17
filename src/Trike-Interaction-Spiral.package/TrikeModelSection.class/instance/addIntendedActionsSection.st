initialization
addIntendedActionsSection
	"Construct the intended actions section."
	| book |
	book := TrikeIntendedActionsSection new.
	self addPageLast: book