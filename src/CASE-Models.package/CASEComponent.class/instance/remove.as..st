accessing
remove: aComponent as: namespace
	"Remove aComponent from the given namespace in my components."
	
	((components at: namespace) includes: aComponent) ifTrue: [
		aComponent noBalanceParent: nil.
		self noBalanceRemove: aComponent as: namespace.
			
		self triggerEvent: #aboutToRemoveComponent withArguments: {self. namespace. aComponent}.
		aComponent triggerEvent: #aboutToChangeParent withArguments: {aComponent. nil}.
		
		self triggerEvent: #removedComponent withArguments: {self. namespace. aComponent}.
		aComponent triggerEvent: #changedParent withArguments: {aComponent. nil}].
	
	^aComponent
