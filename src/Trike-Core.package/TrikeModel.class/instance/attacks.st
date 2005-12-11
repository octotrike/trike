accessing
attacks
	"Answer my threats."
	| result |
	result := SortedCollection
				sortBlock: [:a :b | | aExposure bExposure |
					aExposure := a exposure.
					bExposure := b exposure.
					b exposure
						ifNil: [true]
						ifNotNil: [aExposure isNil or: [bExposure <= aExposure]]].
	self assets
		do: [:asset | result addAll: asset attacks].
	^ result