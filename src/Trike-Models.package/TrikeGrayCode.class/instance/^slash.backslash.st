instance creation
/\ otherCode 
	"Answer an instance of my class which is equivalent to me and 
	otherCode, or nil if otherCode and I cannot be combined into a
	single 
	grayCode."
	| differingBitFound otherIndex result i |
	self truthTable = otherCode truthTable
		ifFalse: [self error: 'Meaningless to combine gray codes from different truth tables'].
	differingBitFound := false.
	otherIndex := otherCode index.
	result := String new: index size.
	i := 1.
	index
		do: [:character | 
			| otherCharacter | 
			otherCharacter := otherIndex at: i.
			character = otherCharacter
				ifTrue: [result at: i put: character]
				ifFalse: [(('01' includes: character)
							and: ['01' includes: otherCharacter])
						ifTrue: ["GrayCodes can only be combined if they
							differ by exactly one bit."
							differingBitFound
								ifTrue: [^ nil].
							differingBitFound := true.
							result at: i put: $?]
						ifFalse: [^ nil]].
			i := i + 1].
	^ self class index: result in: truthTable