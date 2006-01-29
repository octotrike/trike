accessing
linearIndex
	"Answer the linear index which corresponds to me in
	truthTable. "
	self isFullyQualified
		ifFalse: [self error: 'This gray code corresponds to multiple linear indices'].
	^ truthTable grayCodes indexOf: self