accessing
toggleInScope
	"Toggle whether I am in scope.  There must always be at least one out of scope asset in the system."

	inScope
		ifTrue: [self inScope: false]
		ifFalse: [
			(model assets select: [:asset | asset inScope not]) size > 1
				ifTrue: [self inScope: true]].
