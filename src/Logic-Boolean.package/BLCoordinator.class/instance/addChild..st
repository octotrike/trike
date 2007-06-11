accessing
addChild: clause
	"Add an additional clause to my current children.  This is typically called by an analyst, vs. programmatically -- do not simplify."
	children add: clause.
	clause addParent: self.
	self triggerEvent: #children