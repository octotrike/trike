accessing
removeChild: anAttack
	"Remove this attack from my children, without recursing or whatnot."
	super removeChild: anAttack.
	self
		triggerEvent: #noAttack: with: anAttack;
		triggerEvent: #attacks
	