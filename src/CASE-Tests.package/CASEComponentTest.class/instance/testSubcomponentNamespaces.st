running
testSubcomponentNamespaces
	| q |
	q := self targetClass labeled: 'system'.
	
	self should: [q subcomponentNamespaces asSet = #(#subcomponent) asSet]
