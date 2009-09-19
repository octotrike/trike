accessing
adoptChild: node 
	"Replace all of node's former parents with me, and add node to 
	my current children. This is typically called by an analyst, vs. 
	programmatically -- do not simplify."
	node parents copy
		do: [:parent | parent removeChild: node].
	self addChild: node