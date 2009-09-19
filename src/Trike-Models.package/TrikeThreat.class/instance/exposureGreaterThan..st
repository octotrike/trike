comparing
exposureGreaterThan: anotherThreat
	"Nil sorts lowest."
	| myExposure anotherExposure myAsset anotherAsset anotherRiskFactor |
	myExposure := self exposure.
	anotherExposure := anotherThreat exposure.
	anotherExposure 
		ifNil: [
			myExposure ifNotNil: [^true]]
		ifNotNil: [
			myExposure ifNil: [^false].
			myExposure < anotherExposure ifTrue: [^false].
			myExposure > anotherExposure ifTrue: [^true]].
	myAsset := action asset value.
	anotherAsset := anotherThreat action asset value.
	anotherAsset 
		ifNil: [
			myAsset ifNotNil: [^true]]
		ifNotNil: [
			myAsset ifNil: [^false].
			myAsset < anotherAsset ifTrue: [^false].
			myAsset > anotherAsset ifTrue: [^true]].
	anotherRiskFactor := anotherThreat riskFactor.
	anotherRiskFactor 
		ifNil: [
			riskFactor ifNotNil: [^true]]
		ifNotNil: [
			riskFactor ifNil: [^false].
			riskFactor < anotherRiskFactor ifTrue: [^false].
			riskFactor > anotherRiskFactor ifTrue: [^true]].
	"Add something to sort CRUD and DoS vs. Elv."
	^false
