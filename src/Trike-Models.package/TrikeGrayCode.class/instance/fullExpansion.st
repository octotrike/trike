instance creation
fullExpansion
	"Answer all the fully qualified gray codes which correspond to me."

	| grayCodes |
	grayCodes := OrderedCollection new.
	self isFullyQualified 
		ifTrue: 
			[^{ 
				self}]
		ifFalse: 
			[index do: 
					[:character | 
					| nextCharacters |
					nextCharacters := self class nextCharactersFor: character.
					"Add nextCharacters to each string in set."
					grayCodes ifEmpty: [grayCodes addAll: nextCharacters]
						ifNotEmpty: 
							[| newGrayCodes |
							newGrayCodes := grayCodes collect: [:currentCode |
								nextCharacters collect: [:nextCharacter |
									currentCode, nextCharacter]].
							grayCodes := OrderedCollection new.
							newGrayCodes do: [:collection |
								grayCodes addAll: collection]]]].
	^grayCodes collect: [:code | self class index: code in: truthTable]