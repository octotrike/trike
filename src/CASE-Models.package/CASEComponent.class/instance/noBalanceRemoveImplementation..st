private
noBalanceRemoveImplementation: aComponent
	"Remove aComponent from my implementations."

	^implementations remove: aComponent ifAbsent: [nil].