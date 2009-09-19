selection by actor
testSelectByActorOrRoles
	"One of my clauses is a role, which matches. Another clause is 
	a role 
	which doesn't match."
	| result or1 |
	or1 := isStudent \/ isWizard.
	result := or1 selectForActor: student.
	self
		should: [result = #Always]