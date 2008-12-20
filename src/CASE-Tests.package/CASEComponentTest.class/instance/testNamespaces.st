running
testNamespaces
	| q |
	q := self targetClass labeled: 'system'.
	
	self should: [q namespaces asSet = #(#subcomponent #implementation) asSet]
