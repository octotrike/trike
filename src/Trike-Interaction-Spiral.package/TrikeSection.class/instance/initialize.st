initialization
initialize
	"Set my defaults."
	super initialize.
	self setNameTo: self defaultName;
	dropEnabled: false.
	(owner notNil
			and: [owner model notNil])
		ifTrue: [self model: owner model]