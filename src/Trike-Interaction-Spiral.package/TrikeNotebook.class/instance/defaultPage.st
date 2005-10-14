defaults
defaultPage
	^(self pageNamed: 'blog') ifNil: [self pageNamed: 'about']