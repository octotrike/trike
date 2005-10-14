accessing
at: grayCode put: value 
	"Store value for retrieval based on grayCode."
	grayCode linearIndices
		do: [:index | truthTable at: index put: value]