testing
hash
	^ atom hash bitXor: (not ifTrue: [255] ifFalse: [0])