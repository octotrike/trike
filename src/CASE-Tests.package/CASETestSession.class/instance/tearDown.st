testing
tearDown

	session disconnect; closeRepository.
	MagmaRepositoryController delete: 'caseTestRepository'
