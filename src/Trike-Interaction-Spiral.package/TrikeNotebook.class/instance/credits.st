accessing
credits
	"Answer a Collection of helpful people."

	| result |
	result := OrderedCollection new.
	result
		add: ('Theory' -> (({'Paul Saitta, Brenda Larcom'. 'Brenda Larcom, Paul Saitta'} at: 2 atRandom), ' & Michael Eddington'));
		add: ('Tool' -> 'Brenda Larcom, Paul Saitta & Stephanie Smith');
		add: ('Logo' -> 'Ellen Gersh');
		add: ('Immoral Support' -> '3ric Johanson & Tamara Munzner').
	^result