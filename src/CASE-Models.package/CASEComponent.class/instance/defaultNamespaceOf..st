accessing
defaultNamespaceOf: component
	"Answer the namespace that would normally be appropriate to component, if it were added to me."

	^component modelType = self modelType 
		ifTrue: [#subcomponent]
		ifFalse: [#implementation]
