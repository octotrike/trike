accessing
modelType
	"Answer a symbol representing the type of model I am part of.  This symbol is used to determine which component is the top level model for each nested type of model.  Subclasses should override this message."
	
	^#CASE