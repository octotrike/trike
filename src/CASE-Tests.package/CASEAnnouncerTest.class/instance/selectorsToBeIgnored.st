coverage
selectorsToBeIgnored
	"Answer a list of selectors that do not need to be tested."
	
	^#(#announce:withSubject:reannouncingIfNeeded: #announceAndPassUp:), super selectorsToBeIgnored