conversion
nativeRulesXML
	| rulesXML |
	rulesXML := XMLElement named: 'rules'.
	self intendedActions
		do: [:action | | ruleOrNil |
				ruleOrNil := action rule.
				ruleOrNil ifNotNil: [
					ruleOrNil nodesDo: [:rule | rulesXML addElement: rule convertToNativeXML]]].
	^ rulesXML