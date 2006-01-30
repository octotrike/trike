accessing
children
	"Answer my child rules.  This somewhat hackish method is required by TrikeGraphNode>>postCopy because Rules have Actions as parents."
	^ OrderedCollection with: rule