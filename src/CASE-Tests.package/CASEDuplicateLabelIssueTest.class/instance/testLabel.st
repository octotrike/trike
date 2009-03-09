running
testLabel
	| a b i |
	a := 'foo'.
	b := 'bar'.
	i := self targetClass on: #() label: a.
	
	"When an object is created with a label, it should have that label thereafter."
	self should: [i label = a].

	"When an object's label does not change, it should not raise an exception."
	self shouldnt: [i label: a] raise: Error.
	
	"When an object's label changes, it should raise an exception."
	self should: [i label: b] raise: Error.	