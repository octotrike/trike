accessing
intended: aBoolean 
	"Set whether I am an intended action."
	intended = aBoolean
		ifTrue: [^ self].
	intended := aBoolean.
	intended
		ifTrue: [
			self addThreatIfNotAlreadyPresent: TrikeDenialOfServiceThreat.
			rule ifNil: [self removeThreatIfPresent: TrikeElevationOfPrivilegeThreat].
			model changed: #anAction with: self]
		ifFalse: [
			self removeThreatIfPresent: TrikeDenialOfServiceThreat.
			self addThreatIfNotAlreadyPresent: TrikeElevationOfPrivilegeThreat.
			model changed: #noAction with: self]