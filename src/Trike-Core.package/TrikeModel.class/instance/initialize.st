initialization
initialize
	"Set my initial state."
	| externalAsset |
	super initialize.
	name := ''.
	actors := OrderedCollection new.
	assets := OrderedCollection new.
	externalAsset := TrikeAsset named: 'External Asset' in: self.
	externalAsset notes: 'All implicit assets which are not in scope for this system.
	
Every finite system has external assets.   This model includes a generic external asset so that it can include attacks against other (probably not closely related) systems which this system enables.';
		 inScope: false.
	dirty := false.