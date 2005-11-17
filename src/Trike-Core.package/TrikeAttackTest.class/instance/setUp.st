set up
setUp
	"Prepare my test fixture."
	| model |
	super setUp.
	model := TrikeModel named: 'attack test'.
	alice := TrikeActor named: 'Alice' in: model.
	cleartext := TrikeAsset named: 'Cleartext' in: model.
	cleartext value: 1000.
	timestamp := TrikeAsset named: 'Timestamp' in: model.
	readCleartext := cleartext actionAt: #read.
	readCleartext
		rule: (TrikeActorRule actor: alice);
		 intended: true.
	createCleartext := cleartext actionAt: #create.
	createCleartext
		rule: (TrikeActorRule actor: alice);
		 intended: true.
	sniffCiphertext := TrikeAttack named: 'sniff the ciphertext off the wire'.
	decryptCiphertext := TrikeAttack named: 'decrypt the ciphertext'.
	self clearReceivedEvents