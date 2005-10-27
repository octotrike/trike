event handling
update: anAspect 
	"AnAspect of my model has changed. Update myself 
	accordingly. "
	(#(#anAction #noAction #anAsset #noAsset #model #actions #attacks) includes: anAspect)
		ifTrue: [self triggerEvent: #items]
		ifFalse: [self halt]