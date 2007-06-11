initialization
initialize
	"Set my default state."
	instance ifNil: [instance := self on: false]