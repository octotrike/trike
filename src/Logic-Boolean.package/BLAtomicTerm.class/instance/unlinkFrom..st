simplification
unlinkFrom: parent
	"Turn this instance of the identical clause into a seperate instance."
	| replacement |
	replacement := self copy.
	parent replaceChild: self with: replacement.