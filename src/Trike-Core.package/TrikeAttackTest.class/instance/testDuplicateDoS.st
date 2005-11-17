threat generation
testDuplicateDoS
	"Send intended: true to an action which is already intended, then confirm that there is only one denial of service threat for this action."
	self should: [false]