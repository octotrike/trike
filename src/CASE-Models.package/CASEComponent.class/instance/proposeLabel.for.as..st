private
proposeLabel: aString for: subComponent as: namespace
	"If I require unique component labels and one or more of my components already has the label aString, create or update a duplicate component label issue which refers to subComponent and the components I identified."

	requiresUniqueLabels ifTrue: [ | matches |
		matches := (components at: namespace) select: [:c | c label = aString].
		matches ifNotEmpty: [ | existingIssues |
			existingIssues := IdentitySet new.
			matches do: [:c | 
				c localIssues do: [:i | (i isKindOf: CASEDuplicateLabelIssue) ifTrue: [
					existingIssues add: i]]].
			existingIssues 
				ifEmpty: [
					matches add: subComponent.
					CASEDuplicateLabelIssue label: aString for: matches]
				ifNotEmpty: [
					existingIssues only add: subComponent; activate]]]
