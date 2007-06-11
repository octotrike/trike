copying
postCopy
	"Fix graph links."
	
	super postCopy.
	parents := parents copy.
	parents
		do: [:parent | (parent children identityIncludes: self)
				ifFalse: [self removeParent: parent]].