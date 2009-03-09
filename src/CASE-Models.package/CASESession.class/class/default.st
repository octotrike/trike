instance creation
default
	"Answer the default instance of me, creating one if needed."

	^default ifNil: [default := self newDefault].