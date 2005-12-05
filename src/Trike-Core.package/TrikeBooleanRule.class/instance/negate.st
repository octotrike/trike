accessing
negate
	"Negate myself.  Because negating me changes my class, I must replace myself with my negation."
	| replacement |
	replacement := self negated.
	parents do: [:parent |
		parent replaceRule: self with: replacement]