utility functions
nextCharactersFor: indexCharacter
	"Answer a Collection of Strings containing the single characters  
	indicated by this character."
	(#($0 $1 ) includes: indexCharacter)
		ifTrue: [^ {indexCharacter asString}].
	indexCharacter = $?
		ifTrue: [^ #('0' '1' )]