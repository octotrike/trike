comparing
testEquivalenceEquivalent
	self
		should: [sniffCiphertext
				= (TrikeAttack named: 'sniff the ciphertext off the wire')]