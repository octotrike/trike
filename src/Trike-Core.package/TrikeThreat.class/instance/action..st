accessing
action: anAction 
	"Set my action."
	action = anAction
		ifTrue: [^ self].
	self unregisterForActionEvents.
	action := anAction.
	action ifNotNil: [ ruleIsNil := action rule isNil].
	self registerForActionEvents; modelChanged; triggerEvent: #action