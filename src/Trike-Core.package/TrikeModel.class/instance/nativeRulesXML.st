conversion
nativeRulesXML
	| rulesXML |
	rulesXML := XMLElement named: 'rules'.
	self intendedActions
		do: [:action | action rule
				nodesDo: [:rule | rulesXML addElement: rule convertToNativeXML]].
	^ rulesXML