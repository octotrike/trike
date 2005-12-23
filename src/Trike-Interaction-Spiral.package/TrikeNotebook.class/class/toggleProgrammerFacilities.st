accessing
toggleProgrammerFacilities
	"Toggle whether programmer facilities are on or off.  This isn't in Preferences as part of the lockdown package because it's a bit of a weird hack."
	ProgrammerFacilities
		ifTrue: [self disableProgrammerFacilities]
		ifFalse: [Preferences enableProgrammerFacilities].
	ProgrammerFacilities := ProgrammerFacilities not