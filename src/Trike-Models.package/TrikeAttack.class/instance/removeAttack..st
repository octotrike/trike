accessing
removeAttack: anAttack
	"Remove this attack from my children, without recursing or whatnot."
	self removeChild: anAttack
	