accessing
customColumnConstructorSelectors
	"Answer selectors to use to construct my columns."
	^ super customColumnConstructorSelectors , #(#newInScopeMorphOn: #newValueMorphOn:)