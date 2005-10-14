accessing
intendedActions
	^self actions select: [:action | action isIntended]