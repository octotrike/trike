testing
isTop
	"Answer whether I am the top-level model/component of my modelType."
	
	^self parent isNil 
		or: [self parent modelType ~= self modelType] 
		or: [self parent implementations includes: self]