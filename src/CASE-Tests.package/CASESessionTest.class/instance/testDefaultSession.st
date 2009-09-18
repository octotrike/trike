running
testDefaultSession
	"Test creation and automatic use of a default session."
	| default component |
	
	default := self targetClass default.
	self should: [default uri = (FileDirectory default fullNameFor: self targetClass defaultModelRepositoryURI)].
	component := CASEComponent labeled: 'testDefaultSession component'.
	self should: [component session = default].
