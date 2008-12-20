accessing
remove: aComponent as: namespace
	"Remove aComponent from the given namespace in my components."
	
	((components at: namespace) includes: aComponent) ifFalse: [
		"aComponent does not appear in namespace."
		^nil].
	
	aComponent noBalanceParent: nil.
	self noBalanceRemove: aComponent as: namespace.
	
	self triggerEvent: #removeComponent withArguments: {aComponent. namespace}.
	aComponent triggerEvent: #parent with: nil.
	
	^aComponent