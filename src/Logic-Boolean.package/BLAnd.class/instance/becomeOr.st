instance creation
becomeOr
	"Become an OR. Because this changes my class, I must  
	replace myself with the new OR."
	| replacement |
	children
		do: [:child | child removeParent: self].
	replacement := BLOr withSimplifiedChildren: children.
	parents
		do: [:parent | parent replaceChild: self with: replacement]