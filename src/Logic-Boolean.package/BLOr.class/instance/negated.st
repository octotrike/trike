instance creation
negated
	"Answer a new instance of my class, with the opposite 
	meaning. "
	^ BLAnd withSimplifiedChildren: (children collect: [:c | c negated])