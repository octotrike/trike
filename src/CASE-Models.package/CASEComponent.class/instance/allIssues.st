accessing
allIssues
	"Answer the Set of Issues that pertain to me and my subcomponents."
	| answer |
	answer := self issues.
	self components do: [ :c | answer addAll: c allIssues ].
	^ answer