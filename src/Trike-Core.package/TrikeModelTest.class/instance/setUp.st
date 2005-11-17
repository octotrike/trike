set up
setUp
	"Prepare my test fixture."
	
	super setUp.
	model := TrikeModel named: 'model test'.
	alice := TrikeActor named: 'Alice' in: model.
	cleartext := TrikeAsset named: 'Cleartext' in: model.
	createCleartext := cleartext actionAt: #create.
	createCleartext
		rule: (TrikeActorRule actor: alice);
		 intended: true.
	spoofAlice := TrikeAttack named: 'pretend to be Alice'.
	self clearReceivedEvents