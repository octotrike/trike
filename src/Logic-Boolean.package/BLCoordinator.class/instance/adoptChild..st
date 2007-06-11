accessing
adoptChild: clause
	"Replace all of clause's former parents with me, and add clause to 
	my current children. This is typically called by an analyst, vs. 
	programmatically -- do not simplify."
	clause parents copy
		do: [:parent | parent removeChild: clause].
	self addChild: clause