accessing
add: aComponent as: namespace
	"Add aComponent to my components in the given namespace."
	| oldModel oldNamespace |

	((components at: namespace) includes: aComponent) ifFalse: [
		oldModel := aComponent parent.
		oldModel = self ifFalse: [ "aComponent had a different parent"
			aComponent noBalanceParent: self].
		oldModel ifNotNil: [
			oldNamespace := oldModel namespaceOf: aComponent.
			oldModel noBalanceRemove: aComponent as: oldNamespace].
		self noBalanceAdd: aComponent as: namespace.
	
		oldModel ifNotNil: [
			oldModel triggerEvent: #aboutToRemoveComponent withArguments: {oldModel. oldNamespace. aComponent}].
		oldModel = self ifFalse: [
			aComponent triggerEvent: #aboutToChangeParent withArguments: {aComponent. self}].
		self triggerEvent: #aboutToAddComponent withArguments: {self. namespace. aComponent}.
	
		oldModel ifNotNil: [
			oldModel triggerEvent: #removedComponent withArguments: {oldModel. oldNamespace. aComponent}].
		oldModel = self ifFalse: [
			aComponent triggerEvent: #changedParent withArguments: {aComponent. self}].
		self triggerEvent: #addedComponent withArguments: {self. namespace. aComponent}].

	^aComponent
