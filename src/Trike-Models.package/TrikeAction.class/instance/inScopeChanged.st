event handling
inScopeChanged
	"Whether my asset is in scope has changed."
	
	asset inScope
		ifTrue: [
			self
				intended: false]
		ifFalse: [
			self
				intended: true;
				rule: TrikeTextRule initializedInstance]