accessing
removeImplication: anImplication
	"Remove an Implication that no longer pertains to me."

	(implications includes: anImplication) ifTrue: [ | session | 
		session := self session.
		session begin.
		
		self noBalanceRemoveImplication: anImplication.
		anImplication noBalanceRemove: self.
	
		self announce: (CASEAboutToRemoveImplication object: anImplication).
		anImplication announce: (CASEAboutToRemoveComponent object: self).
		
		session commit].

	^anImplication

