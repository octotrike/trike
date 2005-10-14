event handling
wrapped
	| result |
	result := super wrapped.
	result putStringSelector: #name:.
	^ result