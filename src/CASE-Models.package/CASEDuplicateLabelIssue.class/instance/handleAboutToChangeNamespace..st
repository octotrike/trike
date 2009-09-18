event handling
handleAboutToChangeNamespace: anAnnouncement
	"If one of my components is changing namespaces, remove it from me and check to see if it should be added to another issue."
	| component model newNamespace |

	component := anAnnouncement subject.
	model := component parent.
	newNamespace := anAnnouncement newValue.

	self remove: component.
	(self class check: model forDuplicatesLabeled: label in: newNamespace) ifFalse: [
		self class subscribeToNewComponent: component.
		self class subscribeToNonOrphanedComponent: component].
	