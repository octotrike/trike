release
deleteRepository
	"Delete myself.  This is serious; it removes the repository and everything in it."
	
	session ifNotNil: [
		| directory |
		directory := FileDirectory default localNameFor: self uri.
		self abort; disconnect; closeRepository.
		MagmaRepositoryController delete: directory needsWork.
		session := nil.
		(FileDirectory default directoryNamed: directory) recursiveDelete]