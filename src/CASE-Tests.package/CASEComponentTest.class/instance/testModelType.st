running
testModelType
	| q |
	q := self targetClass labeled: 'system'.
	
	"A generic CASE component should have model type #CASE."
	self should: [q modelType = #CASE]
