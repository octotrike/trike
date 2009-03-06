accessing
session
	"Answer an appropriate session for me."
	
	^self isTop 
		ifTrue: [CASESession sessionFor: self]
		ifFalse: [parent session]
