initialization
addAttacksSection
	"Construct the attackss section."
	| book |
	book := TrikeAttacksSection new.
	self addPageLast: book