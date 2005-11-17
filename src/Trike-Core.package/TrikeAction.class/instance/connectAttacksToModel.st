event handling
connectAttacksToModel
	"Notify my model about my existing attacks."
	model
		ifNotNil: [
			attacks do: [:anAttack |
				model triggerEvent: #anAttack: with: anAttack;
				 triggerEvent: #attacks]]