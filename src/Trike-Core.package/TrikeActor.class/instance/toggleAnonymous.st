accessing
toggleAnonymous
	"Toggle whether I am anonymous.  There can be at most one anonymous actor in the system."

	isAnonymous
		ifTrue: [self isAnonymous: false]
		ifFalse: [
			model actors detect: [:actor | actor isAnonymous]
				ifNone: [self isAnonymous: true]].
