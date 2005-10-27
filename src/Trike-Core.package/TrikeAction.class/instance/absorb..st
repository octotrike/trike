event handling
absorb: anAction 
	"Absorb notes and rules from anAction."
	| oldNotes |
	oldNotes := self notes.
	notes := oldNotes , anAction notes.
	notes = oldNotes
		ifFalse: [self triggerEvent: #notes].
	rule
		ifNil: [self rule: anAction rule]
		ifNotNil: [| newRule | 
			newRule := anAction rule.
			newRule
				ifNotNil: [self rule: rule \/ newRule]]