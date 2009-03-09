accessing
remove: aComponent as: namespace
	"Remove aComponent from the given namespace in my components."
	
	^((components at: namespace) includes: aComponent) 
		ifTrue: [ 
			self session commit: [  
				aComponent noBalanceParent: nil.
				self noBalanceRemove: aComponent as: namespace.
		
				self announce: (CASEAboutToRemoveComponent object: aComponent from: namespace).
				aComponent announce: (CASEAboutToChangeParent from: self to: nil)].
			aComponent]
		ifFalse: [nil]
