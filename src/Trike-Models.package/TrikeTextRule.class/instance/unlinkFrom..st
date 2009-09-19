event handling
unlinkFrom: parent
	"Turn this instance of the identical rule into a seperate instance."
	| replacement |
	replacement := self copy.
	parent replaceRule: self with: replacement.