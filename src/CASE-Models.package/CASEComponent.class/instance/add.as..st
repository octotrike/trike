accessing
add: aComponent as: namespace
	"Add aComponent to my components in the given namespace."
	| oldModel oldNamespace |

	((components at: namespace) includes: aComponent) ifTrue: [
		"aComponent already appears in namespace."
		^nil].
	
	oldModel := aComponent parent.
	oldModel = self ifFalse: [ "aComponent had a different parent"
		aComponent noBalanceParent: self].
	oldModel ifNotNil: [
		oldNamespace := oldModel namespaceOf: aComponent.
		oldModel noBalanceRemove: aComponent as: oldNamespace].
	self noBalanceAdd: aComponent as: namespace.
	
	oldModel ifNotNil: [
		oldModel triggerEvent: #removeComponent withArguments: {aComponent. oldNamespace}].
	oldModel = self ifFalse: [
		aComponent triggerEvent: #parent with: self].
	self triggerEvent: #addComponent withArguments: {aComponent. namespace}.

	^aComponent