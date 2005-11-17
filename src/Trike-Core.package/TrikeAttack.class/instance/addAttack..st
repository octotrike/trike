accessing
addAttack: anAttack
	"Add an additional attack to my current children."
	children add: anAttack.
	anAttack addParent: self.
	self triggerEvent: #anAttack: with: anAttack