accessing
parent: newModel
	"Set my container."
	 | newNamespace oldModel oldNamespace |

	parent == newModel ifTrue: [
		"newModel is already my parent."
		^nil].
	
	oldModel := parent.
	self noBalanceParent: newModel.
	oldModel ifNotNil: [
		oldNamespace := oldModel namespaceOf: self.
		oldModel noBalanceRemove: self as: oldNamespace].
	newModel ifNotNil: [
		newNamespace := newModel defaultNamespaceOf: self.
		newModel noBalanceAdd: self as: newNamespace].
	
	oldModel ifNotNil: [
		oldModel triggerEvent: #removeComponent withArguments: {self. oldNamespace}].
	self triggerEvent: #parent with: newModel.
	newModel ifNotNil: [
		newModel triggerEvent: #addComponent withArguments: {self. newNamespace}].
	
	^newModel
	