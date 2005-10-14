accessing
removeThreatIfPresent: threatClass

	attacks copy
		do: [:attack | 
			attack class = threatClass
				ifTrue: [self removeAttack: attack]].
