accessing
exposure
	"Answer my exposure value."
	| genericExposure |
	genericExposure := super exposure.
	^genericExposure
		ifNil: [nil]
		ifNotNil: [genericExposure * 2]