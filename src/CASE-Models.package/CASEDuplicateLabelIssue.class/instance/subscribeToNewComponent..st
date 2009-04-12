private
subscribeToNewComponent: aComponent
	"Listen for announcements from a component I refer to."

	aComponent on: CASEAboutToChangeParent send: #handleAboutToChangeParent: to: self.
	aComponent on: CASEAboutToChangeLabel send: #handleAboutToChangeLabel: to: self.