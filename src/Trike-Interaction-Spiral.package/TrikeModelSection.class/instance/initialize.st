initialization
initialize
	"Set my defaults and construct my submorphs."

	super initialize.
	self
		addActorsSection;
		addAssetsSection;
		addIntendedActionsSection;
		addAttacksSection;
		addSectionOperator;
		goToPageNumber: self initialPageNumber;
		layoutInset: 0