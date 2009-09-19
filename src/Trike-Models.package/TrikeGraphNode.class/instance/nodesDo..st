accessing
nodesDo: aBlock
	"Perform a block on myself and then visit all of my children."

aBlock value: self.
children do: [:child | child nodesDo: aBlock].