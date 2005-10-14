accessing
removeAttack: anAttack
	"Remove this attack from my children, without recursing or whatnot."

	children remove: anAttack.
	anAttack removeParent: self.
	self changed: #attack
	