instance creation
negated
	"Answer a new instance of my class, with the opposite 
	meaning. "
	^ BLOr withSimplifiedChildren: (children collect: [:c | c negated])