initialization
initialize
	"Set my defaults and construct my submorphs."
	super initialize.
	automaticAssessmentSorting := false.
	self addSectionOperator; addAboutSection; addSettingsSection; addOpenSection; goToPage: self defaultPage