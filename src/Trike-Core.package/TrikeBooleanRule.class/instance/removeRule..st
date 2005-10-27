accessing
removeRule: aRule
	"Remove this rule from my children, without recursing or whatnot."

	children remove: aRule.
	aRule removeParent: self.
	self triggerEvent: #rule