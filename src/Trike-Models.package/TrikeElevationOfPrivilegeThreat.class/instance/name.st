accessing
name
	"Answer a short description of me."
	^ 'Someone can ' , action action , ' ' , action asset name
		, (action rule
				ifNil: ['']
				ifNotNil: [' despite rules'])