initialization
buildComponentCreator
	"Create a morph for creating new components."

	componentCreator := UpdatingStringMorph new.
	componentCreator
		stopStepping;
		useStringFormat;
		setNameTo: 'component creator';
		target: self;
		putSelector: #addComponentNamed:;
		setBalloonText: self newComponentInstructions.
	self resetComponentCreator.
	listMorph rowCount: listMorph rowCount + 1.
	listMorph addMorphBack: componentCreator