initialization
initialize
	"Set my initial state."
	
	startingConditions := #('Moon is full' 'Super protection flag is on
Yodelers are in place' 'BIOS has finished executing') atRandom.
	startingPrivileges := #('Send HTTP request to main server' 'Valid Administrator credentials') atRandom.
	threats := #('Delete Transaction Logs
Dumpster Dive' 'Read PII' 'Steal Cowboy Hat') atRandom.		
	responses := #('Prevent' 'Retaliate' 'Thwart' 'Detect' 'Punish') atRandom.
	

