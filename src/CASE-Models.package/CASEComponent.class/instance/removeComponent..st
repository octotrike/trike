accessing
removeComponent: aComponent
	"Remove aComponent from my components."
	
	^(self components includes: aComponent) 
		ifTrue: [ 
			self session commit: [  
				aComponent noBalanceParent: nil.
				self noBalanceRemoveComponent: aComponent.
		
				self announce: (CASEAboutToRemoveComponent object: aComponent).
				aComponent announce: (CASEAboutToChangeParent from: self to: nil)].
			aComponent]
		ifFalse: [nil]
