event handling
wrappedWithParent: anObject
	| result |
	result := super wrappedWithParent: anObject.
	result putStringSelector: #name:.
	^ result