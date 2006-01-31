conversion
convertToNativeXML
	| actionElement knownActorsElement risksElement lessRisk moreRisk dosThreat elvThreat |
	actionElement := XMLElement new.
	actionElement name: 'action'.
	actionElement attributeAt: 'verb' put: self action;
		 attributeAt: 'id' put: self id asString;
		 attributeAt: 'intended' put: self isIntended.
	actionElement addElement: self notesAsNativeXML.
	actionElement addElement: self asset referenceAsNativeXML.
	knownActorsElement := XMLElement new name: 'knownActors'.
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
	dosThreat := self attackAt: TrikeDenialOfServiceThreat.
	elvThreat
		ifNotNil: [moreRisk := elvThreat riskFactor].
	risksElement addElement: XMLElement new;
		 name: 'risk';
		 attributeAt: 'goal' put: 'less';
		 attributeAt: 'value' put: lessRisk asString.
	risksElement addElement: XMLElement new;
		 name: 'risk';
		 attributeAt: 'goal' put: 'more';
		 attributeAt: 'value' put: moreRisk asString.
	actionElement addElement: risksElement.
	^ actionElement