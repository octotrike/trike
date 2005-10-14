accessing
removeAttack: anAttack
	"Remove anAttack from my collection of attacks."
		
	attacks remove: anAttack.
	self changed: #noAttack with: anAttack