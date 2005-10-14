initialization
initializeToStandAlone
	"Set my usual defaults, plus create a model for myself."
	self initialize.
	self
		model: (self defaultModelClass named: self externalName)