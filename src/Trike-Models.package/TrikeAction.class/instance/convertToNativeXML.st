conversion
convertToNativeXML
	| actionElement knownActorsElement risksElement lessRisk moreRisk dosThreat elvThreat riskFactorElement |
	actionElement := XMLElement new.
	actionElement name: 'action'.
	actionElement attributeAt: 'verb' put: self action asString;
		 attributeAt: 'id' put: self id asString;
		 attributeAt: 'intended' put: self isIntended asString.
	actionElement addElement: self notesAsNativeXML.
	actionElement addElement: self asset referenceAsNativeXML.
	knownActorsElement := XMLElement new.
	knownActorsElement name: 'knownActors'.
	self knownActors
		do: [:actor | knownActorsElement addElement: actor referenceAsNativeXML].
	actionElement addElement: knownActorsElement.
	self rule
		ifNotNil: [actionElement addElement: self rule referenceAsNativeXML].
	risksElement := XMLElement new.
	risksElement name: 'risks'.
	lessRisk := 0.
	moreRisk := 0.
	dosThreat := self attackAt: TrikeDenialOfServiceThreat.
	elvThreat := self attackAt: TrikeElevationOfPrivilegeThreat.
	dosThreat
		ifNotNil: [lessRisk := dosThreat riskFactor].
	elvThreat
		ifNotNil: [moreRisk := elvThreat riskFactor].
	riskFactorElement := XMLElement new.
	riskFactorElement name: 'risk';
		 attributeAt: 'goal' put: 'less';
		 attributeAt: 'value' put: lessRisk asString.
	risksElement addElement: riskFactorElement.
	riskFactorElement := XMLElement new.
	riskFactorElement name: 'risk';
		 attributeAt: 'goal' put: 'more';
		 attributeAt: 'value' put: moreRisk asString.
	risksElement addElement: riskFactorElement.
	actionElement addElement: risksElement.
	^ actionElement