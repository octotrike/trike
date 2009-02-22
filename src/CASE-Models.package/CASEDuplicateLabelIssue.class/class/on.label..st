instance creation
on: aCollection label: aString
	"Create a new instance of me with aCollection of Components and aString as the duplicate label."
	
	^self new
		label: aString;
		components: aCollection;
		yourself