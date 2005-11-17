event handling
disconnectAttacksFromModel
	"Notify my model that my existing attacks are going away."
	model
		ifNotNil: [
			attacks do: [:anAttack |
				model triggerEvent: #noAttack: with: anAttack;
				 triggerEvent: #attacks]]