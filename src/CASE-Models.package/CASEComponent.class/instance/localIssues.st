accessing
localIssues
	"Answer the Set of Issues that pertain directly to me."
	
	^implications select: [:i| i isIssue]
			