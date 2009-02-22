accessing
parent: newModel
	"Set my container."
	 | newNamespace oldModel oldNamespace |

	parent == newModel ifFalse: [
		oldModel := parent.
		self noBalanceParent: newModel.
		oldModel ifNotNil: [
			oldNamespace := oldModel namespaceOf: self.
			oldModel noBalanceRemove: self as: oldNamespace].
		newModel ifNotNil: [
			newNamespace := newModel defaultNamespaceOf: self.
			newModel noBalanceAdd: self as: newNamespace].

		oldModel ifNotNil: [
			oldModel triggerEvent: #aboutToRemoveComponent withArguments: {oldModel. oldNamespace. self}].
			self triggerEvent: #aboutToChangeParent withArguments: {self. newModel}.
		newModel ifNotNil: [
			newModel triggerEvent: #aboutToAddComponent withArguments: {newModel. newNamespace. self}].
	
		oldModel ifNotNil: [
			oldModel triggerEvent: #removedComponent withArguments: {oldModel. oldNamespace. self}].
		self triggerEvent: #changedParent withArguments: {self. newModel}.
		newModel ifNotNil: [
			newModel triggerEvent: #addedComponent withArguments: {newModel. newNamespace. self}]].
