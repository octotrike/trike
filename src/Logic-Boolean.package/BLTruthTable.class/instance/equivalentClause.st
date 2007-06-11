converting
equivalentClause
	"Answer an equivalent clause. I use the algorithm described by Terry A.  
	Scott in 'An Algorithm for Simplifying Boolean Functions' at  
	http://www.cs.unco.edu/KARNAUGH/Algorithm.html."
	self initializeCodeCombinations.
	1
		to: atomicTerms size
		do: [:power | self groupCodesToPower: power].
	^ self clauseFromCodeCombinations