accessing
simplify
	"Simplify myself. Because simplifying me may change my 
	class, I must replace myself with my simplification."
	| replacement |
	replacement := self simplified.
	children do: [:child |
		child removeParent: self].
	parents
		do: [:parent | parent replaceChild: self with: replacement]