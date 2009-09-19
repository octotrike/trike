accessing
becomeOr
	"Become an OR. Because this changes my class, I must  
	replace myself with the new OR."
	| replacement |
	children
		do: [:child | child removeParent: self].
	replacement := TrikeOrRule withSimplifiedChildren: children.
	parents
		do: [:parent | parent replaceRule: self with: replacement]