event handling
testAnAttackTrigger
	"Adding an attack should trigger #anAttack:."
	| bruteForce |
	decryptCiphertext
		when: #anAttack:
		send: #receiveEvent:
		to: self.
	bruteForce := TrikeOrAttack named: 'Brute force the session key'.
	decryptCiphertext addAttack: bruteForce.
	self
		should: [receivedEvents includes: bruteForce];
		
		should: [receivedEvents size = 1]