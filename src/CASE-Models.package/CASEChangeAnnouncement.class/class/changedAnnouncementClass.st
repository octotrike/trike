accessing
changedAnnouncementClass
	"Answer the class that is equivalent to me, for changes that have been committed."
	| verb object changedName |

	verb := self verb.
	^verb ifNotNil: [
		object := self object.
		changedName := self prefix, verb inPastTense, object.
		Smalltalk at: changedName asSymbol]
