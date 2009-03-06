instance creation
sessionFor: aComponent
	"Answer an appropriate instance of me for aComponent, creating one if needed."
				
	^SessionRegistry at: aComponent ifAbsentPut: [
		aComponent when: CASEChangedParent do: [:ann | 
			CASESession removeSessionFor: aComponent.
			aComponent unsubscribe: CASESession].
		self allInstances detect: [:session | session root includes: aComponent] 
			ifNone: [self default]]