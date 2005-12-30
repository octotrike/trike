initialization
initialize
	"Set my default state."

	super initialize.

	"The default is true because when people load Trike via SqueakMap, it will be true.  TrikeBuilder toggles this for the released image."
	ProgrammerFacilities := true.
