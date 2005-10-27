accessing
action: anAction 
	"Set my action."
	| asset |
	action = anAction
		ifTrue: [^ self].
	asset := action
				ifNotNil: [action asset].
	asset
		ifNotNil: [asset removeDependent: self].
	action := anAction.
	asset := action
				ifNotNil: [action asset].
	asset
		ifNotNil: [asset addDependent: self].
	self triggerEvent: #action