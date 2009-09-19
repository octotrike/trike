testing
<= anObject
	
	| otherValue |
	self class = anObject class ifFalse: [^false].
	otherValue := anObject value.
	(value notNil and: [otherValue notNil] and: [value < otherValue]) ifTrue: [^true].
	value = otherValue
		ifTrue: [ | otherId |
			otherId := anObject id.
			(id notNil and: [otherId notNil] and: [id < otherId]) ifTrue: [^true].
			(id = otherId and: [name <= anObject name]) ifTrue: [^true]].
	^false
		
	