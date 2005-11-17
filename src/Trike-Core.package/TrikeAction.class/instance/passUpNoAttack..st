event handling
passUpNoAttack: anAttack 
	"Notify my model that anAttack has been removed."
	model
		ifNotNil: [model triggerEvent: #noAttack: with: anAttack;
				 triggerEvent: #attacks].
	asset triggerEvent: #noAttack: with: anAttack