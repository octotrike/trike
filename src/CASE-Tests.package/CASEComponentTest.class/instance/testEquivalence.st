running
testEquivalence
	| a b i j k m q |
	a := 'foo'.
	b := 'bar'.
	i := self parentClass labeled: a.
	j := self parentClass labeled: a.
	k := self targetClass labeled: b.
	m := self targetClass labeled: b.
	q := self parentClass labeled: b.
		
	"A component should be equal to itself, but NOT to another component with the same label."
	self should: [i == i].
	self shouldnt: [i == j].
	
	"A component should be equivalent to itself and a component with the same label, but NOT to an object of a different class or a component with a different label."
	self should: [i = i]. 
	self should: [i = j].
	(self parentClass = self targetClass) ifFalse: [self shouldnt: [m = q]].
	self shouldnt: [i = k].

	"A component should NOT be equivalent to another component unless both their labels and their components are equivalent."
	self should: [k = m].
	i add: k as: #subcomponent.
	self shouldnt: [i = j].
	j add: m as: #subcomponent.
	self should: [i = j].	
		

	


	