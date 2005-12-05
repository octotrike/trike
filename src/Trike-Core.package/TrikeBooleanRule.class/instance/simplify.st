accessing
simplify
	"Simplify myself. Because simplifying me may change my 
	class, I must replace myself with my simplification."
	| replacement |
	replacement := self simplified.
	parents
		do: [:parent | parent replaceRule: self with: replacement]