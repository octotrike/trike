event handling
handleAboutToChangeNamespace: anAnnouncement
	"Decide if an instance of myself is implied."
	| component model namespace label |

	component := anAnnouncement subject.
	model := component parent.
	namespace := anAnnouncement newValue.
	label := component label.
	label ifNotNil: [
		self check: model forDuplicatesLabeled: label in: namespace]
	

	 