accessing
replaceChild: oldNode with: newNode 
	"Replace oldNode with newNode in my collection of children."
	| index |
	index := children identityIndexOf: oldNode.
	children at: index put: newNode.
	oldNode removeParent: self.
	newNode addParent: self.
	self triggerEvent: #children