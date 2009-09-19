event handling
testNoActionTrigger
	"Making an action unintended should trigger #noAction:."
	model
		when: #noAction:
		send: #receiveEvent:
		to: self.
	createCleartext intended: false.
	self
		should: [receivedEvents includes: createCleartext];
		should: [receivedEvents size = 1]