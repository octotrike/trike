accessing
designated: nameString
	"Set my name."

	designation := nameString.
	self triggerEvent: #designated: with: designation