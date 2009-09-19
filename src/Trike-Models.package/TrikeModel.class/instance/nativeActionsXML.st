conversion
nativeActionsXML
	| actionsXML actions |
	actionsXML := XMLElement named: 'actions'.
	(actions := self actions)
		ifNotNil: [actions do: [:action | actionsXML addElement: action convertToNativeXML]].
	^ actionsXML