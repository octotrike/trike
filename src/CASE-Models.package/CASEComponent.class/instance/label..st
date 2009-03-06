accessing
label: aString
	"Set my human-readable label."

	aString = label ifFalse: [ | oldLabel session | 
		session := self session.
		session begin.
		
		oldLabel := label.
		label := aString.
		
		self announce: (CASEAboutToChangeLabel from: oldLabel to: label).

		session commit].
