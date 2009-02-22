accessing
allIssues
	"Answer the Set of Issues that pertain to me and my subcomponents."
	| answer |
	
	answer := self localIssues.
	self subcomponents do: [:c |
		answer addAll: c allIssues].
	^answer