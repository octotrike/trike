accessing
addImplementation: aComponent
	"Add aComponent to my implementations."

	(implementations includes: aComponent) ifFalse: [
		self session commit: [ | oldModel | 
		
		oldModel := aComponent parent.
		oldModel = self ifFalse: [ "aComponent had a different parent"
			aComponent noBalanceParent: self].
		oldModel ifNotNil: [
			oldModel noBalanceRemoveImplementation: aComponent].
		self noBalanceAddImplementation: aComponent.
	
		oldModel ifNotNil: [
			oldModel announce: (CASEAboutToRemoveImplementation object: aComponent)].
		oldModel = self 
			ifFalse: [aComponent announce: (CASEAboutToChangeParent from: oldModel to: self)].
		self announce: (CASEAboutToAddImplementation object: aComponent)]].

	^aComponent