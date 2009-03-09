accessing
parent: newModel
	"Set my container."

	parent == newModel ifFalse: [
		self session commit: [ | newNamespace oldModel oldNamespace | 
			oldModel := parent.
			self noBalanceParent: newModel.
			oldModel ifNotNil: [
				oldNamespace := oldModel namespaceOf: self.
				oldModel noBalanceRemove: self as: oldNamespace].
			newModel ifNotNil: [
				newNamespace := newModel defaultNamespaceOf: self.
				newModel noBalanceAdd: self as: newNamespace].

			oldModel ifNotNil: [
				oldModel announce: (CASEAboutToRemoveComponent object: self from: oldNamespace)].
			oldModel = self ifFalse: [
				self announce: (CASEAboutToChangeParent from: oldModel to: newModel)].
			newModel announce: (CASEAboutToAddComponent object: self to: newNamespace)]]
