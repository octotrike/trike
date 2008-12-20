event handling
activate
	"Activate myself."
	| needsTrigger |
	
	isActive ifTrue: [^self].
	
	needsTrigger := components select: [:c |
		c hasActiveIssues not].
	isActive := true.
	needsTrigger do: [:c |
		c triggerHasActiveIssues: true].
	components do: [:c |
		c passTriggerUp: #addIssue with: self] 
