testing
hash
	^children inject: 0 into: [:currentHash :child | currentHash bitXor: child hash]
