accessing
adoptRule: aRule
	"Replace all of aRule's former parents with me, and add aRule to my current children.  This is typically called by an analyst, vs. programmatically -- do not simplify."
	aRule parents do: [:parent |
		parent removeRule: aRule].
	self addRule: aRule