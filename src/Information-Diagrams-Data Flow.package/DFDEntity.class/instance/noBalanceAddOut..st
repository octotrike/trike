private
noBalanceAddOut: aDFDEntity
	"Add aDFDEntity to my outgoing links, without adding myself to its incoming links."

	out ifNil: [out _ Set new].
	out add: aDFDEntity.
