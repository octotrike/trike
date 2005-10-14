initialization
layoutFrameFor: aMorph 
	| half result height |
	half := aMorph width / 2.
	height := aMorph height.
	result := LayoutFrame
				fractions: (0.5 @ 0 corner: 0.5 @ 0)
				offsets: ((0 - half) @ heightCounter corner: half @ (heightCounter + height)).
	heightCounter := heightCounter + height + self verticalSpacing.
	^ result