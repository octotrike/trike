event handling
handleAboutToChangeLabel: anAnnouncement
	"Decide if an instance of myself is implied."
	| component model namespace label |
	
	component := anAnnouncement subject.
	model := component parent.
	namespace := model namespaceOf: component.
	label := anAnnouncement newValue.
	label ifNotNil: [
		self check: model forDuplicatesLabeled: label in: namespace]

	 