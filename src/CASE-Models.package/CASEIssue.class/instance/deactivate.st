event handling
deactivate
	"Deactivate myself."
	| needsTrigger |
	
	isActive ifFalse: [^self].
	
	needsTrigger := components select: [:c |
		c activeIssues size = 1].
	isActive := false.
	needsTrigger do: [:c |
		c triggerHasActiveIssues: false]. 
	components do: [:c |
		c passTriggerUp: #removeIssue with: self] 