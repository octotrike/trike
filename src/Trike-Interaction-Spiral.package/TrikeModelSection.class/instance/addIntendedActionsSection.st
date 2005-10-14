initialization
addIntendedActionsSection
	"Construct the intended actions section."
	| book |
	book := TrikeIntendedActionsSection new.
	book model: self model.
	self addPageLast: book