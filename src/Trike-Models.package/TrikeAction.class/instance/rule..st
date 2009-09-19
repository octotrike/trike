accessing
rule: aRule 
	"Set the single TrikeRule which expresses when this action is allowed to 
	occur.  If aRule is non-nil, also set intended: true, because it is
	meaningless to apply rules to unintended actions."

	aRule = #Never ifTrue: [^self intended: false].
	rule = aRule 
		ifFalse: [
			rule ifNotNil: [rule removeParent: self].
			rule := aRule isSymbol ifFalse: [aRule].
			rule ifNil: [
					intended 
						ifTrue: [self removeThreatIfPresent: TrikeElevationOfPrivilegeThreat]]
				ifNotNil: [
					self 
						intended: true;
						addThreatIfNotAlreadyPresent: TrikeElevationOfPrivilegeThreat;
						updateKnownActors.
					rule addParent: self]].
	self triggerEvent: #rule