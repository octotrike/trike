accessing
removeImplementation: aComponent
	"Remove aComponent from my implementations."
	
	^(implementations includes: aComponent) 
		ifTrue: [ 
			self session commit: [  
				aComponent noBalanceParent: nil.
				self noBalanceRemoveImplementation: aComponent.
		
				self announce: (CASEAboutToRemoveImplementation object: aComponent).
				aComponent announce: (CASEAboutToChangeParent from: self to: nil)].
			aComponent]
		ifFalse: [nil]