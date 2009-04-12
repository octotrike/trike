instance tests
testAnnounceAboutToOutsideTransaction
	"Confirm that instances of my targetClass cannot announce AboutTo outside a transaction."
	| announcer aboutTo |

	announcer := self targetClass new.
	aboutTo := CASEAboutToMockA new.
	self shouldnt: [announcer session inTransaction].
	self should: [announcer announce: aboutTo] raise: CASENoTransaction
