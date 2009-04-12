testing
abortWouldUndo
	"Answer whether aborting the current transaction would make me irrelevant."
	
	^self session reannouncementQueue includes: [:ann |
		(ann isKindOf: CASEAboutToCreateInstance) and: [ann object = self]]