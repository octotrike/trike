accessing
toggleRepresentsSystem
	"Toggle whether I represent the system itself. There can be at 
	most one such actor in the system."
	
	representsSystem
		ifTrue: [self representsSystem: false]
		ifFalse: [
			model actors
				detect: [:actor | actor representsSystem]
				ifNone: [self representsSystem: true]].