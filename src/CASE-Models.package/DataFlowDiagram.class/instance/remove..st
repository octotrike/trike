accessing
remove: aDFDEntity
	"Remove aDFDEntity from my components."

	components ifNotNil: [
		(components remove: aDFDEntity) parent: nil]
	