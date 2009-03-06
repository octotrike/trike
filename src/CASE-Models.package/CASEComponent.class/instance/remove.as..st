accessing
remove: aComponent as: namespace
	"Remove aComponent from the given namespace in my components."
	
	((components at: namespace) includes: aComponent) ifTrue: [ | oldModel session | 
		session := self session.
		session begin.
		
		oldModel := parent.
		aComponent noBalanceParent: nil.
		self noBalanceRemove: aComponent as: namespace.
		
		oldModel announce: (CASEAboutToRemoveComponent object: aComponent from: namespace).
		aComponent announce: (CASEAboutToChangeParent from: self to: nil).
	
		session commit].
	
	^aComponent
