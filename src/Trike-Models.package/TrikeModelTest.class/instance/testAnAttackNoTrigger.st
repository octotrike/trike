event handling
testAnAttackNoTrigger
	"Adding an attack somewhere in an attack tree should not trigger #anAttack: for the model."
	| threat |
	threat := createCleartext attacks anyOne.
	model
		when: #anAttack:
		send: #receiveEvent:
		to: self.
	threat addAttack: spoofAlice.
	self
		should: [receivedEvents isEmpty]