accessing
intended: aBoolean 
	"Set whether I am an intended action.  If I am no longer an intended action, set my rule to nil."

	intended = aBoolean ifTrue: [^self].
	intended := aBoolean.
	intended 
		ifTrue: 
			[self addThreatIfNotAlreadyPresent: TrikeDenialOfServiceThreat.
			rule ifNil: [self removeThreatIfPresent: TrikeElevationOfPrivilegeThreat].
			model
				triggerEvent: #anAction: with: self;
				triggerEvent: #intendedActions.
			self triggerEvent: #rule]
		ifFalse: 
			[self removeThreatIfPresent: TrikeDenialOfServiceThreat.
			self addThreatIfNotAlreadyPresent: TrikeElevationOfPrivilegeThreat.
			model
				triggerEvent: #noAction: with: self;
				triggerEvent: #intendedActions.
			self rule: nil]