running
testNew
	"Test the new method and the defaults it sets."
	| instance |
	
	self shouldnt: [instance := self targetClass new] raise: Error.
	self should: [instance uri = (FileDirectory default fullNameFor: Preferences modelRepositoryURI)]