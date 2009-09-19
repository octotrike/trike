threat generation
testDuplicateElv
	"Send intended: false to an action which is already unintended, then confirm that there is only one elevation of privilege threat for this action."
	self should: [false]