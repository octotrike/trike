event handling
testNoAttackTrigger
	"Removing an attack should trigger #noAttack:."
	| bruteForce |
	decryptCiphertext
		when: #noAttack:
		send: #receiveEvent:
		to: self.
	bruteForce := TrikeOrAttack named: 'Brute force the session key'.
	decryptCiphertext addAttack: bruteForce;
		 removeAttack: bruteForce.
	self
		should: [receivedEvents includes: bruteForce];
		
		should: [receivedEvents size = 1]