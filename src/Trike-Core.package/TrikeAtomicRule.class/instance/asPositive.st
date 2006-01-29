accessing
asPositive
	"Answer a (possibly new) similar instance of my class, with a
	positive sense."
	^ not
		ifTrue: [self negated]
		ifFalse: [self]