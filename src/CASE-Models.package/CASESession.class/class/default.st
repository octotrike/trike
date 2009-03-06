instance creation
default
	"Answer the default instance of me, creating one if needed."

	default isNil 
		ifTrue: [default := self newDefault].
	^ default