conversion
nativeActionsXML
	| actionsXML |
	actionsXML := XMLElement named: 'actions'.
	self intendedActions
		ifNotNil: [self intendedActions do: [:action | actionsXML addElement: action convertToNativeXML]].
	^ actionsXML