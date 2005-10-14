accessing
addRule: aRule
	"Add an additional rule to my current children.  This is typically called by an analyst, vs. programmatically -- do not simplify."
	children add: aRule.
	aRule addParent: self.
	self changed: #rule