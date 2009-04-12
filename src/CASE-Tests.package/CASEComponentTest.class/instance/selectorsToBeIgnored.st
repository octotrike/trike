coverage
selectorsToBeIgnored
	"Answer a list of selectors that do not need to be tested."
	
	^#(#announceNoActiveIssuesIfNeeded 
	#announceHasActiveIssuesIfNeeded
	#newComponents 
	#newImplications 
	#prepositionFor: 
	#printLabelOn: 
	#printLabelQualifierOn:for: 
	#printOn: 
	#noBalanceAddComponent:
	#noBalanceAddImplementation:
	#noBalanceAddImplication: 
	#noBalanceRemoveComponent: 
	#noBalanceRemoveImplementation: 
	#noBalanceRemoveImplication:), super selectorsToBeIgnored