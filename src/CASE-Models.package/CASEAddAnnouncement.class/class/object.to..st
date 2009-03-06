instance creation
object: newComponent to: newNamespace
	^(self new)
		object: newComponent;
		namespace: newNamespace;
		yourself