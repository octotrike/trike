private
noBalanceRemove: aComponent as: namespace
	"Remove aComponent from my components."

	^(components at: namespace) remove: aComponent ifAbsent: [nil].