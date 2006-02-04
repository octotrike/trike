accessing
addAttack: anAttack 
	"Add anAttack to my collection of attacks."
	anAttack registerForActionEvents.
	attacks add: anAttack.
	self triggerEvent: #anAttack: with: anAttack.
	asset triggerEvent: #anAttack: with: anAttack.
	model triggerEvent: #anAttack: with: anAttack