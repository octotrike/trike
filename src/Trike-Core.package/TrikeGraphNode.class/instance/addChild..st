accessing
addChild: node
	"Add an additional node to my current children.  This is typically called by an analyst, vs. programmatically -- do not simplify."
	children add: node.
	node addParent: self.
	self triggerEvent: #children