accessing
disallowFor: anActor 
	^(anActor = actor and: [not not])
		ifTrue: [nil] 
		ifFalse: 
			["This action is already disallowed for anActor; continue 
			including this clause."

			self]