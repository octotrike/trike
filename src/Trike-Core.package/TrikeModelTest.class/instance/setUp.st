set up
setUp
	"Prepare my test fixture."
	super setUp.
	model := TrikeModel named: 'Model Test'.
	alice := TrikeActor named: 'Alice' in: model.
	cleartext := TrikeAsset named: 'Cleartext' in: model.
	createCleartext := cleartext actionAt: #Create.
	createCleartext
		rule: (TrikeActorRule actor: alice);
		 intended: true.
	spoofAlice := TrikeAttack named: 'Pretend to be Alice'.
	self clearReceivedEvents