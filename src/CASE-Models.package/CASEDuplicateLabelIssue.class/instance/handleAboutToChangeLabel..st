event handling
handleAboutToChangeLabel: anAnnouncement
	"If one of my components is changing labels, remove it from me and check to see if it should be added to another issue."
	| component model newLabel |

	component := anAnnouncement subject.
	model := component parent.
	newLabel := anAnnouncement newValue.
	
	self remove: component.
	newLabel ifNotNil: [
		(self class check: model forDuplicatesLabeled: newLabel) ifFalse: [
			self class subscribeToNewComponent: component.
			self class subscribeToNonOrphanedComponent: component]].
