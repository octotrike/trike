accessing
wrappedRules
	"Answer my children, wrapped."
	^ (Array with: rule)
		collect: [:child | child wrappedWithParent: self]