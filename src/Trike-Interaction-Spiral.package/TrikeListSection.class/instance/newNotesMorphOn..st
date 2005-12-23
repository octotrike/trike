initialization
newNotesMorphOn: aComponent 
	"Answer a new morph on the notes of aComponent."
	| result |
	result := PluggableTextMorph new.
	result 
		on: aComponent
		text: #notes
		accept: #notes:
		readSelection: nil
		menu: nil;

		extent: 400@120;
		alwaysShowScrollBars: false;
		setNameTo: 'notes';
		setBalloonText: 'Press ctl-s or cmd-s to save.'.
	^ result