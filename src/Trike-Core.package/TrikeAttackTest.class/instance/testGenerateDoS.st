threat generation
testGenerateDoS
	"Confirm an unintended action has no denial of service threat.  Send intended: true, then confirm that it has one denial of service threat."
	self should: [false]