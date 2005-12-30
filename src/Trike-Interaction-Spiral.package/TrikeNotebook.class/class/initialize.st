initialization
initialize
	"Set my default state."

	super initialize.

	"The default is true because when people load Trike via SqueakMap, it will be true.  The build script toggles this."
	ProgrammerFacilities := true.

	"The default is false because when people load Trike via SqueakMap, it will be false.  The dev build script toggles this."
	DevelopmentVersion := false