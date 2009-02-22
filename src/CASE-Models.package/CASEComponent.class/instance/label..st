accessing
label: aString
	"Set my human-readable label."

	self session begin.
	aString = label ifFalse: [
		label := aString.
		self triggerEvent: #aboutToChangeLabel withArguments: {self. label}.
		self triggerEvent: #changedLabel withArguments: {self. label}]
