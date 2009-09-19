accessing
removeChild: node 
	"Remove this node from my children, without recursing or
	whatnot. "
	children removeAt: (children identityIndexOf: node).
	node removeParent: self.
	self triggerEvent: #children