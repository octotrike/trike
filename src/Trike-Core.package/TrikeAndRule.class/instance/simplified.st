instance creation
simplified
	"Answer a simplified version of myself."
	| result roleRules positiveRules negativeRules resultChildren |
	result := super simplified.
	(result isSymbol
			or: [result canHaveChildren not])
		ifTrue: [^ result].
	roleRules := result children
				select: [:rule | rule isActorRule].
	positiveRules := roleRules
				select: [:rule | rule not not].
	negativeRules := roleRules
				select: [:rule | rule not].
	"This assumes a user cannot be in more than one role 
	simultaneously."
	positiveRules size > 1
		ifTrue: [^ #Never].
	positiveRules size = 1
		ifTrue: [negativeRules
				do: [:rule | result removeRule: rule]].
	resultChildren := result children.
	resultChildren isEmpty
		ifTrue: [^ nil].
	resultChildren size = 1
		ifTrue: [^ result children only].
	^ result