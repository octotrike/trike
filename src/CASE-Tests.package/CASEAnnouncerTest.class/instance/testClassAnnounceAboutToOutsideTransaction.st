class tests
testClassAnnounceAboutToOutsideTransaction
	"Modeled on CASEAnnouncerTest>>testAnnounceAboutToOutsideTransaction."
	| announcer aboutTo |

	announcer := self targetClass.
	aboutTo := CASEAboutToMockA new.
	self shouldnt: [announcer session inTransaction].
	self should: [announcer announce: aboutTo] raise: CASENoTransaction