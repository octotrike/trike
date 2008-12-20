accessing
addMorphsFor: object
	"Add a morph for the given object to my pasteUp.  May add more than one morph, as a side effect."
	
	| primaryMorph |
	"Do nothing if this method has already been called."
	morphs at: object uuid ifPresent: [:array | array ifNotEmpty: [^self]].

	"Create and add the primary morph for this object."
	primaryMorph := self newMorphFor: object.
	self addMorph: primaryMorph for: object.
	
	"Add morphs for objects which depend on this object."
	primaryMorph dependentModels do: [:m |
		self addMorphsFor: m].
	
	"Add additional morphs which are needed to display this object."
	primaryMorph addMorphsTo: self. 

	
