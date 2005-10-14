accessing
rule: aRule 
	"Set the single TrikeRule which expresses when this action is allowed to 
	aRule."
	rule = aRule
		ifFalse: [
			rule
				ifNil: [intended ifTrue: [self addThreatIfNotAlreadyPresent: TrikeElevationOfPrivilegeThreat]]
				ifNotNil: [rule removeParent: self].
			rule := aRule.
			rule
				ifNil: [intended ifTrue: [self removeThreatIfPresent: TrikeElevationOfPrivilegeThreat]]
				ifNotNil: [rule addParent: self]].
	self changed: #rule