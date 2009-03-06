testing
setUp
	MagmaRepositoryController create: 'caseTestRepository' root: IdentitySet new.
	session := CASESession on: 'caseTestRepository'.