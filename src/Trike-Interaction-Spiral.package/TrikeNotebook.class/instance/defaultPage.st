defaults
defaultPage
	^ (self pageNamed: 'Blog')
		ifNil: [self pageNamed: 'About']