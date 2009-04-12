event handling
handleAboutToChangeLabel: anAnnouncement
	"Decide if an instance of myself is implied."
	| component model label |
	
	component := anAnnouncement subject.
	model := component parent.
	label := anAnnouncement newValue.
	label ifNotNil: [
		self check: model forDuplicatesLabeled: label]

	 