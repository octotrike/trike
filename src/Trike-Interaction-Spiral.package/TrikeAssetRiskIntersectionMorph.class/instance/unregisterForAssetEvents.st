event handling
unregisterForAssetEvents
	"Unregister for events from my asset."
	asset
		ifNotNil: [
			asset
				removeActionsWithReceiver: self forEvent: #anAttack:;
				removeActionsWithReceiver: self forEvent: #noAttack:]