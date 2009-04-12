initialization
initialize
	"Set my initial state."
	"self initialize"
	
	super initialize.
	CASEComponent on: CASEAboutToCreateInstance send: #handleAboutToCreateInstance: to: self.