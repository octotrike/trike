event handling
unlinkFrom: parent
	"Turn all instances of the identical rule into seperate instances."
	| replacement |
	replacement := self copy.
	parent replaceRule: self with: replacement.