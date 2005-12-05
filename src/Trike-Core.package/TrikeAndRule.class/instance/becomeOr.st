accessing
becomeOr
	"Become an OR. Because this changes my class, I must 
	replace myself with the new OR."
	| replacement |
	replacement := TrikeOrRule withSimplifiedChildren: children.
	parents
		do: [:parent | parent replaceRule: self with: replacement]