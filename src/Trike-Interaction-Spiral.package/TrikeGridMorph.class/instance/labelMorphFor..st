construction
labelMorphFor: component 
	"Answer a row or column label for the given component."

	| result |
	result := UpdatingStringMorph new.
	result
		useStringFormat;
		target: component.
	component isEditable
		ifTrue: [ 
			result
				getSelector: #name;
				putSelector: #name:]
		ifFalse: [
			result getSelector: #label].
	^result