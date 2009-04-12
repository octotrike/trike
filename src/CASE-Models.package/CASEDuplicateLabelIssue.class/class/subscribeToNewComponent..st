event handling
subscribeToNewComponent: aComponent
	"Listen for announcements from a new or orphaned instance of Component."

	aComponent on: CASEAboutToChangeParent send: #handleAboutToChangeParent: to: self.
	