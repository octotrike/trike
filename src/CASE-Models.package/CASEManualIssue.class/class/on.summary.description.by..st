instance creation
on: components summary: shortString description: longString by: aPerson
	"Create a new instance of myself regarding the given components, at the behest of aPerson."
	
	^self new on: (components ifNil: [#()]) summary: shortString description: longString by: aPerson