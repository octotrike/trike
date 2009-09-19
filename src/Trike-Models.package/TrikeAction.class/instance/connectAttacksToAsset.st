event handling
connectAttacksToAsset
	"Notify my asset of my existing attacks."
	asset ifNotNil: [
	attacks
		do: [:anAttack | asset triggerEvent: #anAttack: with: anAttack]]