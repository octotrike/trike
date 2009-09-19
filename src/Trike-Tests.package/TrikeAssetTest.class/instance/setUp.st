set up
setUp
	"Prepare my test fixture."
	| model |
	super setUp.
	model := TrikeModel named: 'Action Test'.
	cleartext := TrikeAsset named: 'Cleartext' in: model.
	cleartext value: 1000.
	self clearReceivedEvents