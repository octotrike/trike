accessing
disallowFor: anActor 
	"Change my rule to disallow my action for anActor."

	rule 
		ifNil: [
			intended 
				ifTrue: [ | notMe |
					notMe := TrikeActorRule actor: anActor.
					notMe not: true.
					self rule: notMe]
				ifFalse: [self triggerEvent: #rule]]
		ifNotNil: [
			self rule: (rule disallowFor: anActor).
			rule ifNil: 
					["Because previously, there was a rule, if 
					rule disallowFor: answers nil, it means we have
					disallowed the last situation in which this
					action is intended, therefore we  should
					remove ourselves entirely."

					self intended: false]]