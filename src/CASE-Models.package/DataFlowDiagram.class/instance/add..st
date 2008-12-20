accessing
add: aDFDEntity
	"Add aDFDEntity to my components."

	components ifNil: [ components _ Set new ].
	(components add: aDFDEntity) parent: self.
