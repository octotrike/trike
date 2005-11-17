threat generation
testGenerateElv
	"Confirm an intended action with no rule has no elevation of privilege threat.  Send intended: false, then confirm that it has one elevation of privilege threat."
	self should: [false]