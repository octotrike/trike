accessing
label: aString
	"Set my human-readable label."

	aString = label ifFalse: [
		parent ifNotNil: [
			parent proposeLabel: aString for: self as: (parent namespaceOf: self)].
		label := aString.
		self triggerEvent: #label with: aString].


			