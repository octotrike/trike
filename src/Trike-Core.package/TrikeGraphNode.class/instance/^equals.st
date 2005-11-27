testing
= anObject 
	"Answer whether I am equivalent to anObject."
	^ super = anObject
		and: [(self canHaveChildren not) or: [self children = anObject children]]