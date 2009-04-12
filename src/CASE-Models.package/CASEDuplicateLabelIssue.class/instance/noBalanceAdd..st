private
noBalanceAdd: aComponent
	"Add aComponent to my components."

	aComponent unsubscribe: self class.
	self subscribeToNewComponent: aComponent.
	^super noBalanceAdd: aComponent