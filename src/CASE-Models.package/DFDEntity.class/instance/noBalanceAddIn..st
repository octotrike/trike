private
noBalanceAddIn: aDFDEntity
	"Add aDFDEntity to my incoming links, without adding myself to its outgoing links."

	in ifNil: [in _ Set new].
	in add: aDFDEntity.
