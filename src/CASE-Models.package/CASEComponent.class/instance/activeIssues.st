accessing
activeIssues
	"Answer the Set of actve Issues that pertain to me or my subcomponents."
	| answer |
	
	answer := issues select: [:i | i isActive].
	self subcomponents do: [:c |
		answer addAll: c activeIssues].
	^answer
			