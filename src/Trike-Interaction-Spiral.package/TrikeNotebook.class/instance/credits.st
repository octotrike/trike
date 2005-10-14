accessing
credits
	"Answer a Collection of helpful people."

	| result |
	result := OrderedCollection new.
	result
		add: ('Theory' -> (({'Paul Saitta, Brenda Larcom'. 'Brenda Larcom, Paul Saitta'} at: 2 atRandom), ' & Michael Eddington'));
		add: ('Tool' -> 'Brenda Larcom & Paul Saitta');
		add: ('Data Visualization Advisor' -> 'Tamara Munzner');
		add: ('Logo' -> 'Ellen Gersh');
		add: ('Moral Support' -> '3ric Johanson').
	^result