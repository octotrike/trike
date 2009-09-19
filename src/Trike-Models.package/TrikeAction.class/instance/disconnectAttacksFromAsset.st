event handling
disconnectAttacksFromAsset
	"Notify my asset that my existing attacks are going away."

	asset ifNotNil: [
		attacks do: [:anAttack |
			asset triggerEvent: #noAttack: with: anAttack]]