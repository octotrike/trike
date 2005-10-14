accessing
addAttack: anAttack
	"Add anAttack to my collection of attacks."
		
	attacks add: anAttack.
	self changed: #anAttack with: anAttack