running
testModelType
	| q |
	q := self targetClass labeled: 'system'.
	
	"A generic CASE component should have model type CASEComponent."
	self should: [q modelType = CASEComponent]
