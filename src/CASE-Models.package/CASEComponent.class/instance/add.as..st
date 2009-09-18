accessing
add: aComponent as: namespace
	"Add aComponent to my components in the given namespace."

	((components at: namespace) includes: aComponent) ifFalse: [
		self session commit: [ | oldModel oldNamespace | 
		
		oldModel := aComponent parent.
		oldModel = self ifFalse: [ "aComponent had a different parent"
			aComponent noBalanceParent: self].
		oldModel ifNotNil: [
			oldNamespace := oldModel namespaceOf: aComponent.
			oldModel noBalanceRemove: aComponent as: oldNamespace].
		self noBalanceAdd: aComponent as: namespace.
	
		oldModel ifNotNil: [
			oldModel announce: (CASEAboutToRemoveComponent object: aComponent from: oldNamespace)].
		oldModel = self 
			ifTrue: [aComponent announce: (CASEAboutToChangeNamespace from: oldNamespace to: namespace)]
			ifFalse: [aComponent announce: (CASEAboutToChangeParent from: oldModel to: self)].
		self announce: (CASEAboutToAddComponent object: aComponent to: namespace)]].

	^aComponent