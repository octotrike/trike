set up
setUp
	"Prepare my test fixture."
	
	| model |
	super setUp.
	model := TrikeModel named: 'action test'.
	alice := TrikeActor named: 'Alice' in: model.
	self clearReceivedEvents