accessing
removeChild: node
	"Remove this node from my children, without recursing or whatnot."

	children remove: node.
	node removeParent: self.
	self triggerEvent: #children