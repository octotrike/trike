accessing
addThreatIfNotAlreadyPresent: threatClass

	attacks
		detect: [:attack | attack class = threatClass]
		ifNone: [ | newThreat |
			newThreat := threatClass action: self.
			self addAttack: newThreat]