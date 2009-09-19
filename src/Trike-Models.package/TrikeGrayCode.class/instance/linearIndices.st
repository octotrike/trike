accessing
linearIndices
	"Answer the linear index numbers which correspond to me in 
	truthTable. "
	| grayCodes |
	grayCodes := self fullExpansion.
	^ grayCodes
		collect: [:grayCode | grayCode linearIndex]