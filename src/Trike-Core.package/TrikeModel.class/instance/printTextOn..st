streaming
printTextOn: aStream 
	aStream nextPutAll: 'Name: '; nextPutAll: name; cr;
		 cr; nextPutAll: 'Assets:'; cr.
	assets
		do: [:asset | asset printTextOn: aStream].
	aStream cr; nextPutAll: 'Actors: '; cr.
	actors
		do: [:actor | actor printTextOn: aStream].
	aStream cr; nextPutAll: 'Intended Actions: '; cr.
	self intendedActions
		do: [:action | action printTextOn: aStream].
	aStream cr; nextPutAll: 'Threats and Attacks: '; cr.
	self attacks
		do: [:attack | attack printTextOn: aStream]