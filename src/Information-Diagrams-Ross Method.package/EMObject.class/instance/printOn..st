streaming
printOn: aStream
	"Print a text identifier for me on aStream."
	
	| id |
	super printOn: aStream.
	id := self designation.
	(id notNil and: [id notEmpty]) ifTrue: [
		aStream nextPut: $(;
			nextPutAll: id;
			nextPut: $)]