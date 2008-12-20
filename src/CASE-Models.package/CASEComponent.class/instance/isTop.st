testing
isTop
	"Answer whether I am the top-level model/component of my modelType."
	
	^parent isNil 
		or: [parent modelType ~= self modelType] 
		or: [(parent namespaceOf: self) = #implementation]