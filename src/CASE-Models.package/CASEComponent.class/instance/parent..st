accessing
parent: newModel
	"Set my container."

	parent == newModel ifFalse: [
		self session commit: [ | oldModel | 
			oldModel := parent.
			self noBalanceParent: newModel.
			oldModel ifNotNil: [oldModel noBalanceRemoveComponent: self].
			newModel ifNotNil: [newModel noBalanceAddComponent: self].

			oldModel ifNotNil: [
				oldModel announce: (CASEAboutToRemoveComponent object: self)].
			self announce: (CASEAboutToChangeParent from: oldModel to: newModel).
			newModel ifNotNil: [
				newModel announce: (CASEAboutToAddComponent object: self)]]]
