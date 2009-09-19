event handling
testDeepAnAttackTrigger
	"Adding an attack should pass #anAttack: up."
	| bruteForce buildDict |
	bruteForce := TrikeOrAttack named: 'Brute force the session key'.
	decryptCiphertext addAttack: bruteForce.
	decryptCiphertext
		when: #anAttack:
		send: #receiveEvent:
		to: self.
	buildDict := TrikeOrAttack named: 'Build dictionary of keys to try'.
	bruteForce addAttack: buildDict.
	self
		should: [receivedEvents includes: buildDict];
		
		should: [receivedEvents size = 1]