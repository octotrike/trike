event handling
wrappedChildren
	"Answer my children, wrapped."
	^ self children
		collect: [:child | child wrappedWithParent: self]