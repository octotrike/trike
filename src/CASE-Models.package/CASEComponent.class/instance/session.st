accessing
session
	"Answer an appropriate session for me."
	
	^self isTop 
		ifTrue: [super session]
		ifFalse: [self parent session]
