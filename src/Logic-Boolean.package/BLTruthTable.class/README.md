CLASS

Each instance of me is an alternative representation of a BLClause.  An instance of me is used to simplify the Boolean expression given by the corresponding BLClause into a single OR of ANDs.

Instance variables:

atomicTerms		An OrderedCollection of the positive versions of the BLAtomicTerms which make up this Boolean expression.
truthTable		An Array of truth values for this Boolean expression.
grayCodes		A cache of BLGrayCodes which are used as indices into truthTable.

codeCombinations	A Dictionary of atomicTerm combinations used only during the simplification process.
	
See BLExpression for more information.
