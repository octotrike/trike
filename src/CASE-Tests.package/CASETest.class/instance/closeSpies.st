release
closeSpies
	"Close and delete my spies."
	
	spies do: [:spy | spy close].
	self initializeSpies