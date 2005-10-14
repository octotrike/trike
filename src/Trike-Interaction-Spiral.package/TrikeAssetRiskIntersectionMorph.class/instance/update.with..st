event handling
update: anAspect with: aParameter 
	"My asset has changed. Does it pertain to me?"
	(aParameter class = parameter
			and: [aParameter action = actionSymbol]) ifTrue: [
		anAspect = #anAttack ifTrue: [
			self threat: aParameter].
		anAspect = #noAttack ifTrue: [
			self threat: nil]].
	super update: anAspect with: aParameter