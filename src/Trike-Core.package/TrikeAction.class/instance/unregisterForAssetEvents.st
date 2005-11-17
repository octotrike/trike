event handling
unregisterForAssetEvents
	"Unregister for events from my asset."

	asset ifNotNil: [
		asset 
			removeActionsWithReceiver: self forEvent: #model;
			removeActionsWithReceiver: self forEvent: #name;
			removeActionsWithReceiver: self forEvent: #value;
			removeActionsWithReceiver: self forEvent: #inScope]