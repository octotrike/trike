private
noBalanceRemoveComponent: aComponent
	"Remove aComponent from my components."

	^components remove: aComponent ifAbsent: [nil].