instance creation
from: oldValue to: newValue
	^(self new)
		oldValue: oldValue;
		newValue: newValue;
		yourself