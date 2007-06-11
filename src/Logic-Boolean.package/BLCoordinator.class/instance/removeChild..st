accessing
removeChild: clause 
	"Remove this clause from my children, without recursing or
	whatnot."
	children removeAt: (children identityIndexOf: clause).
	clause removeParent: self.
	self triggerEvent: #children