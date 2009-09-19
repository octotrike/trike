accessing
exposure
	"Answer my exposure value."
	| assetValue |
	assetValue := action asset value.
	^(assetValue notNil and: [riskFactor notNil])
		ifTrue: [assetValue * riskFactor]
		ifFalse: [nil]