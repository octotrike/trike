accessing
becomeAnd
	"Become an AND.  Because this changes my class, I must replace myself with the new AND."
	| replacement |
	replacement := TrikeAndRule withSimplifiedChildren: children.
	parents
		do: [:parent | parent replaceRule: self with: replacement]