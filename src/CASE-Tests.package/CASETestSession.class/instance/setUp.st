testing
setUp
	MagmaRepositoryController create: 'caseTestRepository' root: IdentitySet new.
	session := MagmaSession openLocal: 'caseTestRepository'.
	session connectAs: Utilities authorInitials.
	