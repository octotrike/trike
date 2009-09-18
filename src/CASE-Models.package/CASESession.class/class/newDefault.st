instance creation
newDefault
	^self on: self defaultModelRepositoryURI createIfNeeded: true
