accessing
replaceChild: oldClause with: newClause
	"Replace oldClause with newClause in my collection of children."
	| index |
	index := children identityIndexOf: oldClause.
	children at: index put: newClause.
	oldClause removeParent: self.
	newClause addParent: self.
	self triggerEvent: #children