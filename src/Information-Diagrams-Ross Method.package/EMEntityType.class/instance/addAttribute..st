accessing
addAttribute: anAttribute
	"Add anAttribute to my set of attributes."
	
	anAttribute anchor: self.
	attributes at: anAttribute designation put: anAttribute