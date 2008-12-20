private
noBalanceAdd: aComponent as: namespace
	"Add aComponent to my components in the given namespace."
	
	self proposeLabel: aComponent label for: aComponent as: namespace.
	^(components at: namespace) add: aComponent
	