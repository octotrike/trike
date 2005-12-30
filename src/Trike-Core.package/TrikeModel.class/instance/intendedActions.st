accessing
intendedActions
	"Answer my intended actions."
	^self actions select: [:action | action isIntended]