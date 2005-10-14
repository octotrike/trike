initialization
newNotesMorphOn: aComponent 
	"Answer a new morph on the notes of aComponent."
	| result |
	result := AcceptableCleanTextMorph new.
	result alwaysShowScrollBars: false;
		setNameTo: 'notes';
		setBalloonText: 'Press ctl-s or cmd-s to save.';
		
		on: aComponent
		text: #notes
		accept: #notes:
		readSelection: nil
		menu: nil.
	^ result