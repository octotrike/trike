event handling
passUpAnAttack: anAttack 
	"Notify my model that anAttack has been added."
	model
		ifNotNil: [model triggerEvent: #anAttack: with: anAttack;
				 triggerEvent: #attacks].
	asset triggerEvent: #anAttack: with: anAttack