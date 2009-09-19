accessing
setRulesForActor: anActor to: possibilitySymbol 
	"Fix up my rule and knownActors such that the given 
	possibilitySymbol is answered for queries about anActor."
	"The rules for actions on out of scope assets cannot be 
	changed."
	"If this possibilitySymbol would already be answered, nothing 
	needs to be changed."
	(asset inScope not
			or: [possibilitySymbol
					= (self rulesForActor: anActor)])
		ifTrue: [^ self].
	"Fix up knownActors."
	possibilitySymbol = #Unknown
		ifTrue: [knownActors remove: anActor].
	(#(#Never #Sometimes #Always ) includes: possibilitySymbol)
		ifTrue: [knownActors add: anActor].
	"Fix up my rule."
	(#(#Unknown #Never ) includes: possibilitySymbol)
		ifTrue: [self disallowFor: anActor]
		ifFalse: [| newRule | 
			newRule := TrikeActorRule actor: anActor.
			possibilitySymbol = #Sometimes
				ifTrue: [| secondRule | 
					secondRule := TrikeTextRule initializedInstance.
					newRule := newRule /\ secondRule].
			self rule: newRule \/ rule.
			self intended: true]