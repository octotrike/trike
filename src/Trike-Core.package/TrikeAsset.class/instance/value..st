accessing
value: aNumber 
	"Set my value, typically in monetary units."
	value := aNumber asInteger.
	self triggerEvent: #value
	
