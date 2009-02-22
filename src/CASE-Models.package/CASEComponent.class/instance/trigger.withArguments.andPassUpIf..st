event handling
trigger: aSymbol withArguments: anArray andPassUpIf: aBlockOrBoolean
	"I, or one of my subcomponents, just had something happen which I and my parent may need to know.  Notify those who need to know."

	self triggerEvent: aSymbol withArguments: anArray.
	(self isTop not and: [
		aBlockOrBoolean isSelfEvaluating 
			ifTrue: [aBlockOrBoolean]
			ifFalse: [aBlockOrBoolean value: self value: anArray]]) ifTrue: [ 
		parent trigger: aSymbol withArguments: anArray andPassUpIf: aBlockOrBoolean]
