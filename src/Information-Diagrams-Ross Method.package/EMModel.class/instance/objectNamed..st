accessing
objectNamed: nameString
	"Answer the object named by the given nameString."
	
	^namedObjects at: nameString ifAbsent: [
		objects detect: [:object | object designation = nameString]]