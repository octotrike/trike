initialization
initialize
	"Set my default state."

	super initialize.

	"The default is true because when people load Trike via SqueakMap, it will be true.  The build script toggles this."
	ProgrammerFacilities := true