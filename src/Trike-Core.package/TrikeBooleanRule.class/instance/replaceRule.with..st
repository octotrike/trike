accessing
replaceRule: oldRule with: newRule 
	"Replace oldRule with newRule in my collection of children."
	| index |
	index := children identityIndexOf: oldRule.
	children at: index put: newRule.
	oldRule removeParent: self.
	newRule addParent: self.
	self triggerEvent: #rule