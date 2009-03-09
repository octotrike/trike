instance creation
newDefault
	| uri |
	uri := self defaultModelRepositoryURI.
	^[self on: uri] on: MagmaEnvironmentError do: [:ex | 
		MagmaRepositoryController create: uri root: nil.
		self on: uri].