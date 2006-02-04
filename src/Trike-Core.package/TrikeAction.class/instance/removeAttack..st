accessing
removeAttack: anAttack 
	"Remove anAttack from my collection of attacks."
	anAttack unregisterForActionEvents.
	attacks remove: anAttack.
	self triggerEvent: #noAttack: with: anAttack.
	asset triggerEvent: #noAttack: with: anAttack.
	model triggerEvent: #noAttack: with: anAttack