instantiation
new
	"Answer a new instance of myself."
	| instance |
	
	^self session commit: [
		instance := super new.
		
		self announce: (CASEAboutToCreateInstance object: instance).
		
		instance]