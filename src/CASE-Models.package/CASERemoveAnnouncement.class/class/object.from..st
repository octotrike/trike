instance creation
object: oldComponent from: oldNamespace
	^(self new)
		object: oldComponent;
		namespace: oldNamespace;
		yourself