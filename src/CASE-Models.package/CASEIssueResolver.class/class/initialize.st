initialization
initialize
	"Set my initial state."
	
	"self initialize"
	
	super initialize.
	Preferences 
		addOrderPreference: #issueResolutionStrategy 
		category: #modeling 
		default: #(#Postpone #Ask #Mitigate #Undo)
		values: (self subclasses 
			select: [:c | c applicableModelTypes includes: #CASE] 
			thenCollect: [:c | c preferenceValue])
		balloonHelp: 'determines order in which to apply issue resolution strategies'