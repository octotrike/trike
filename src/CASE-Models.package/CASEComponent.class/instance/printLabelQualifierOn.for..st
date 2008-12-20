streaming
printLabelQualifierOn: aStream for: childComponent
	"Qualify the label for childComponent by appending an appropriate preposition and my label to aStream."
	
	label ifNotNil: [
		childComponent label ifNotNil: [aStream nextPut: Character space].
		aStream 
			nextPutAll: (self prepositionFor: childComponent);
			nextPutAll: label]