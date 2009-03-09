instance creation
sessionFor: aComponent
	"Answer an appropriate instance of me for aComponent, creating one if needed."
				
	^self allInstances detect: [:session | session includes: aComponent] 
			ifNone: [self default]