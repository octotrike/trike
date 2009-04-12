accessing
addComponent: aComponent
	"Add aComponent to my subcomponents."

	(self components includes: aComponent) ifFalse: [
		self session commit: [ | oldModel oldNamespace | 
		
		oldModel := aComponent parent.
		oldModel = self ifFalse: [ "aComponent had a different parent"
			aComponent noBalanceParent: self].
		oldModel ifNotNil: [
			oldModel noBalanceRemoveComponent: aComponent].
		self noBalanceAddComponent: aComponent.
	
		oldModel ifNotNil: [
			oldModel announce: (CASEAboutToRemoveComponent object: aComponent)].
		oldModel = self 
			ifFalse: [aComponent announce: (CASEAboutToChangeParent from: oldModel to: self)].
		self announce: (CASEAboutToAddComponent object: aComponent)]].

	^aComponent