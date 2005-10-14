Each of my instances is an alternative representation of a TrikeRule.  I am used to simplify the Boolean expression given by a TrikeRule into a single OR of ANDs.

It should be possible to separate most of the TrikeRule hierarchy, TrikeGrayCode and I into a more general Boolean expression library.

Instance variables:

atomicTerms			An OrderedCollection of the positive versions of the TrikeAtomicRules which make up this Boolean expression.
truthTable			An Array of truth values for this Boolean expression.
grayCodes			A cache of TrikeGrayCodes which are used as indices into truthTable.

codeCombinations	A Dictionary of atomicTerm combinations used only during the simplification process.