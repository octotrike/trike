accessing
addIn: aDFDEntity
	"Add aDFDEntity to my list of incoming links."

	self noBalanceAddIn: aDFDEntity.
	aDFDEntity noBalanceAddOut: self.
	
