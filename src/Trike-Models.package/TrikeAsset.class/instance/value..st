accessing
value: nilOrNumber
	"Set my value, typically in monetary units."
	| result |
	result := nilOrNumber ifNotNil: [nilOrNumber asInteger].
	value = result ifFalse: [
		value := result.
		self triggerEvent: #value].
	^ true