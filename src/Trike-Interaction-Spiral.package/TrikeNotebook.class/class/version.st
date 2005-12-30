accessing
version
	^ '1.1.2a', (self isDevelopmentVersion ifTrue: ['-dev'] ifFalse: [''])