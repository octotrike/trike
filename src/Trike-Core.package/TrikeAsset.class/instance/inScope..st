accessing
inScope: aBoolean 
	"Set whether I am in scope for this model."
	inScope = aBoolean
		ifTrue: [^ self].
	inScope := aBoolean.
	self triggerEvent: #inScope
	
