private
noBalanceAdd: aComponent as: namespace
	"Add aComponent to my components in the given namespace."
	
	^(components at: namespace) add: aComponent
	