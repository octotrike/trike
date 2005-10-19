accessing
addOut: aDFDEntity
	"Add aDFDEntity to my list of outgoing links."

	self noBalanceAddOut: aDFDEntity.
	aDFDEntity noBalanceAddIn: self.
	
