threat generation
testRemoveElv
	"Confirm an unintended action with no rule has an elevation of privilege threat.  Send intended: true, then confirm that it has no elevation of privilege threat."
	self should: [false]