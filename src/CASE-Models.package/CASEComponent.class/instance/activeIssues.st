accessing
activeIssues
	"Answer the Set of actve Issues that pertain to me or my subcomponents."
	| answer |
	
	answer := implications select: [:i | i isIssue and: [i isActive]].
	self components do: [:c |
		answer addAll: c activeIssues].
	^answer
			