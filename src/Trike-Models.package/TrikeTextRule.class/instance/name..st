accessing
name: aString 
	"Set my name to aString."
	| nameString |
	nameString := aString withBlanksCondensed.
	nameString := (nameString beginsWith: 'NOT ')
		ifTrue: [ 
			self not: true.
			nameString copyFrom: 5 to: nameString size ]
		ifFalse: [
			self not: false.
			nameString ].
	super name: nameString.