event handling
registerForAssetEvents
	"Register for events from my asset."
	asset
		ifNotNil: [
			asset
				when: #anAttack: send: #aThreat: to: self;
				when: #noAttack: send: #noThreat: to: self]