instance creation
negated
	"Answer a new instance of my class, with the opposite meaning."
	| negatedChildren |
	negatedChildren := children
				collect: [:each | each negated].
	^ TrikeOrRule withSimplifiedChildren: negatedChildren