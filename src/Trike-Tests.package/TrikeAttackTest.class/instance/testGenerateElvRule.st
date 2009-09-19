threat generation
testGenerateElvRule
	"Confirm an intended action with no rule has no elevation of privilege threat.  Add a rule, then confirm that it has one elevation of privilege threat."
	self should: [false]