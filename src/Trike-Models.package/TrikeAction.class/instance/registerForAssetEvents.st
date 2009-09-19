event handling
registerForAssetEvents
	"Register for events from my asset."
	asset
		ifNotNil: [
			asset
				when: #model send: #modelChanged to: self;
				when: #name send: #triggerEvent: to: self with: #name;
				when: #value send: #triggerEvent: to: self with: #value;
				when: #inScope send: #inScopeChanged to: self]