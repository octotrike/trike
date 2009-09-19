copying
postCopy
	"Fix graph links."
	super postCopy.
	parents := parents copy.
	children := children copy.
	parents
		do: [:parent | (parent children identityIncludes: self)
				ifFalse: [self removeParent: parent]].
	children
		do: [:child | (child parents includes: self)
				ifFalse: [child addParent: self]]