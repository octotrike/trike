event handling
testAnActionTrigger
	"Making an action intended should trigger #anAction:."
	model
		when: #anAction:
		send: #receiveEvent:
		to: self.
	createCleartext intended: false.
	self
		shouldnt: [receivedEvents includes: createCleartext].
	createCleartext intended: true.
	self
		should: [receivedEvents includes: createCleartext];
		should: [receivedEvents size = 1]