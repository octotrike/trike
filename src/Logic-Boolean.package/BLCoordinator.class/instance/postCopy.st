copying
postCopy
	"Fix graph links."
	super postCopy.
	children := children copy.
	children
		do: [:child | (child parents includes: self)
				ifFalse: [child addParent: self]]