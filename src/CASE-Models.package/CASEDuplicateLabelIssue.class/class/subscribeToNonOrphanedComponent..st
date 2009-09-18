event handling
subscribeToNonOrphanedComponent: aComponent
	"Listen for announcements from an instance of Component that has a non-nil parent."

	aComponent on: CASEAboutToChangeLabel send: #handleAboutToChangeLabel: to: self.
	aComponent on: CASEAboutToChangeNamespace send: #handleAboutToChangeNamespace: to: self

	