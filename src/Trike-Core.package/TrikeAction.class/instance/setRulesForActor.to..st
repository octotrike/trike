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
	possibilitySymbol = #unknown
		ifTrue: [knownActors remove: anActor].
	(#(#never #sometimes #always ) includes: possibilitySymbol)
		ifTrue: [knownActors add: anActor].
	"Fix up my rule."
	TmpFnord ifTrue: [self halt].
	(#(#unknown #never ) includes: possibilitySymbol)
		ifTrue: [self disallowFor: anActor]
		ifFalse: [| newRule | 
			newRule := TrikeActorRule actor: anActor.
			possibilitySymbol = #sometimes
				ifTrue: [| secondRule | 
					secondRule := TrikeTextRule initializedInstance.
					newRule := newRule /\ secondRule].
			self rule: newRule \/ rule.
			self intended: true]