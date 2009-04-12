event handling
mitigate
	"Apply default mitigation."
	| m |
	
	m := self defaultMitigation.
	m ifNotNil: [
		self apply: m]