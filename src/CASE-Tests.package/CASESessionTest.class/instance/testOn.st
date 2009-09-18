running
testOn
	"Test creating a session on a particular model repository."
	| uri instance |
	
	uri := Preferences modelRepositoryURI.
	self should: [instance := self targetClass on: uri] raise: MagmaEnvironmentError.
	self shouldnt: [instance := self targetClass on: uri createIfNeeded: true] raise: Error.
	self should: [instance uri = (FileDirectory default fullNameFor: uri)].
	instance deleteRepository
