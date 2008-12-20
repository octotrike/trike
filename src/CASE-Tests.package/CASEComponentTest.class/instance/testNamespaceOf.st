running
testNamespaceOf
	| i q j k iNamespace kNamespace m mNamespace |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'gear'.
	k := self targetClass labeled: 'chain'.
	m := self targetClass labeled: 'performance tuned engine'.
	q := self parentClass labeled: 'system'.
	iNamespace := #subcomponent.
	kNamespace := #subcomponent.	
	mNamespace := #implementation.
	
	"namespaceOf: should answer the same namespace a component was added in."
	q add: i as: iNamespace.
	q add: m as: mNamespace.
	self should: [(q namespaceOf: i) = iNamespace].
	self should: [(q namespaceOf: m) = mNamespace].

	"If an argument is not in the receiver at all, namespaceOf: should answer nil."
	self should: [(q namespaceOf: j) isNil].
	
	"If an argument is in one of the receiver's components, namespaceOf: should still answer nil."
	m add: k as: kNamespace.
	self should: [(q namespaceOf: k) isNil].
	