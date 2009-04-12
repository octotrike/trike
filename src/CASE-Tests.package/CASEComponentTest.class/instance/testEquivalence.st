running
testEquivalence
	| a b i j k q r | 
	a := 'foo'.
	b := 'bar'.
	i := self targetClass labeled: a.	
	j := self targetClass labeled: a.
	k := self targetClass labeled: b.	
	q := self parentClass labeled: a. 
	r := self parentClass labeled: a.	
	
	"A component should be equal to itself, but NOT to another component with the same label."
	self should: [i == i].
	self shouldnt: [i == j].

	"A component should be equivalent to itself and a component with the same label, but NOT to an object of a different class or a component with a different label."
	self should: [i = i]. 
	self should: [i hash = i hash].
	self should: [i = j].
	self should: [i hash = j hash].
	(self parentClass = self targetClass) ifFalse: [self shouldnt: [i = q]].
	self shouldnt: [i = k].

	"A component should NOT be equivalent to another component unless both their labels and their components are equivalent."
	self should: [q = r].
	q addComponent: i.
	self shouldnt: [q = r].
	r addComponent: j.
	self should: [q = r].	
		

	


	