accessing
addChild: anAttack
	"Add an additional attack to my current children."
	super addChild: anAttack.
	self 
		triggerEvent: #anAttack: with: anAttack;
		triggerEvent: #attacks