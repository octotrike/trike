accessing
addImplication: anImplication
	"Add an Implication that pertains to me."

	(implications includes: anImplication) ifFalse: [ | session | 
		session := self session.
		session begin.
		
		self noBalanceAddImplication: anImplication.
		anImplication noBalanceAdd: self.

		self announce: (CASEAboutToAddImplication object: anImplication).
		anImplication announce: (CASEAboutToAddComponent object: self).
		
		session commit].
	
	^anImplication
			
