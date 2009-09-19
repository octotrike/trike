testing
hash
	^ super hash bitXor: (not ifTrue: [1] ifFalse: [0])