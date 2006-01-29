set up
setUp
	"Prepare my test fixture."
	| model |
	super setUp.
	model := TrikeModel named: 'Attack Test'.
	alice := TrikeActor named: 'Alice' in: model.
	cleartext := TrikeAsset named: 'Cleartext' in: model.
	cleartext value: 1000.
	timestamp := TrikeAsset named: 'Timestamp' in: model.
	readCleartext := cleartext actionAt: #Read.
	readCleartext
		rule: (TrikeActorRule actor: alice);
		 intended: true.
	createCleartext := cleartext actionAt: #Create.
	createCleartext
		rule: (TrikeActorRule actor: alice);
		 intended: true.
	sniffCiphertext := TrikeAttack named: 'Sniff the ciphertext off the wire'.
	decryptCiphertext := TrikeAttack named: 'Decrypt the ciphertext'.
	self clearReceivedEvents