instance creation
label: aString for: aCollection
	"Create a new instance of me with aCollection of Components and aString as the duplicate label."
	
	^self new
		label: aString;
		components: aCollection;
		yourself