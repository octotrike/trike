accessing
name
	"Answer a short description of me."

	^'Actor cannot ', action action, ' ', action asset name,
		(action rule ifNil: [''] ifNotNil: [' according to rules'])